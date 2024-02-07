// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_day_task.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCurrentDayTaskCollection on Isar {
  IsarCollection<CurrentDayTask> get currentDayTasks => this.collection();
}

const CurrentDayTaskSchema = CollectionSchema(
  name: r'CurrentDayTask',
  id: 5617073698216062115,
  properties: {
    r'rank': PropertySchema(
      id: 0,
      name: r'rank',
      type: IsarType.string,
    ),
    r'taskId': PropertySchema(
      id: 1,
      name: r'taskId',
      type: IsarType.long,
    )
  },
  estimateSize: _currentDayTaskEstimateSize,
  serialize: _currentDayTaskSerialize,
  deserialize: _currentDayTaskDeserialize,
  deserializeProp: _currentDayTaskDeserializeProp,
  idName: r'currentDayTaskId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _currentDayTaskGetId,
  getLinks: _currentDayTaskGetLinks,
  attach: _currentDayTaskAttach,
  version: '3.1.0+1',
);

int _currentDayTaskEstimateSize(
  CurrentDayTask object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.rank;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _currentDayTaskSerialize(
  CurrentDayTask object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.rank);
  writer.writeLong(offsets[1], object.taskId);
}

CurrentDayTask _currentDayTaskDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CurrentDayTask();
  object.currentDayTaskId = id;
  object.rank = reader.readStringOrNull(offsets[0]);
  object.taskId = reader.readLongOrNull(offsets[1]);
  return object;
}

P _currentDayTaskDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _currentDayTaskGetId(CurrentDayTask object) {
  return object.currentDayTaskId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _currentDayTaskGetLinks(CurrentDayTask object) {
  return [];
}

void _currentDayTaskAttach(
    IsarCollection<dynamic> col, Id id, CurrentDayTask object) {
  object.currentDayTaskId = id;
}

extension CurrentDayTaskQueryWhereSort
    on QueryBuilder<CurrentDayTask, CurrentDayTask, QWhere> {
  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterWhere>
      anyCurrentDayTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CurrentDayTaskQueryWhere
    on QueryBuilder<CurrentDayTask, CurrentDayTask, QWhereClause> {
  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterWhereClause>
      currentDayTaskIdEqualTo(Id currentDayTaskId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: currentDayTaskId,
        upper: currentDayTaskId,
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterWhereClause>
      currentDayTaskIdNotEqualTo(Id currentDayTaskId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(
                  upper: currentDayTaskId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(
                  lower: currentDayTaskId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(
                  lower: currentDayTaskId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(
                  upper: currentDayTaskId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterWhereClause>
      currentDayTaskIdGreaterThan(Id currentDayTaskId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(
            lower: currentDayTaskId, includeLower: include),
      );
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterWhereClause>
      currentDayTaskIdLessThan(Id currentDayTaskId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: currentDayTaskId, includeUpper: include),
      );
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterWhereClause>
      currentDayTaskIdBetween(
    Id lowerCurrentDayTaskId,
    Id upperCurrentDayTaskId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerCurrentDayTaskId,
        includeLower: includeLower,
        upper: upperCurrentDayTaskId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CurrentDayTaskQueryFilter
    on QueryBuilder<CurrentDayTask, CurrentDayTask, QFilterCondition> {
  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      currentDayTaskIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentDayTaskId',
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      currentDayTaskIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentDayTaskId',
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      currentDayTaskIdEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentDayTaskId',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      currentDayTaskIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentDayTaskId',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      currentDayTaskIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentDayTaskId',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      currentDayTaskIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentDayTaskId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      rankIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rank',
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      rankIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rank',
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      rankEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rank',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      rankGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rank',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      rankLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rank',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      rankBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rank',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      rankStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rank',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      rankEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rank',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      rankContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rank',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      rankMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rank',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      rankIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rank',
        value: '',
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      rankIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rank',
        value: '',
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      taskIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taskId',
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      taskIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taskId',
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      taskIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskId',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      taskIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskId',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      taskIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskId',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterFilterCondition>
      taskIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CurrentDayTaskQueryObject
    on QueryBuilder<CurrentDayTask, CurrentDayTask, QFilterCondition> {}

extension CurrentDayTaskQueryLinks
    on QueryBuilder<CurrentDayTask, CurrentDayTask, QFilterCondition> {}

extension CurrentDayTaskQuerySortBy
    on QueryBuilder<CurrentDayTask, CurrentDayTask, QSortBy> {
  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterSortBy> sortByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.asc);
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterSortBy> sortByRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.desc);
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterSortBy> sortByTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.asc);
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterSortBy>
      sortByTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.desc);
    });
  }
}

extension CurrentDayTaskQuerySortThenBy
    on QueryBuilder<CurrentDayTask, CurrentDayTask, QSortThenBy> {
  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterSortBy>
      thenByCurrentDayTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDayTaskId', Sort.asc);
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterSortBy>
      thenByCurrentDayTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDayTaskId', Sort.desc);
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterSortBy> thenByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.asc);
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterSortBy> thenByRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.desc);
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterSortBy> thenByTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.asc);
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QAfterSortBy>
      thenByTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.desc);
    });
  }
}

extension CurrentDayTaskQueryWhereDistinct
    on QueryBuilder<CurrentDayTask, CurrentDayTask, QDistinct> {
  QueryBuilder<CurrentDayTask, CurrentDayTask, QDistinct> distinctByRank(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rank', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CurrentDayTask, CurrentDayTask, QDistinct> distinctByTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskId');
    });
  }
}

extension CurrentDayTaskQueryProperty
    on QueryBuilder<CurrentDayTask, CurrentDayTask, QQueryProperty> {
  QueryBuilder<CurrentDayTask, int, QQueryOperations>
      currentDayTaskIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentDayTaskId');
    });
  }

  QueryBuilder<CurrentDayTask, String?, QQueryOperations> rankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rank');
    });
  }

  QueryBuilder<CurrentDayTask, int?, QQueryOperations> taskIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskId');
    });
  }
}
