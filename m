Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1A654E4316
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Mar 2022 16:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbiCVPgV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Mar 2022 11:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234751AbiCVPgU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Mar 2022 11:36:20 -0400
X-Greylist: delayed 676 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Mar 2022 08:34:52 PDT
Received: from mx07-005c9601.pphosted.com (mx07-005c9601.pphosted.com [205.220.184.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95904AE49
        for <linux-watchdog@vger.kernel.org>; Tue, 22 Mar 2022 08:34:52 -0700 (PDT)
Received: from pps.filterd (m0237839.ppops.net [127.0.0.1])
        by mx08-005c9601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22M3sJHJ022763;
        Tue, 22 Mar 2022 16:23:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wago.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=p012021;
 bh=dVdKBTeAjIeB7/kGxyoFilfNibCnrSyGT5vkY/jNodw=;
 b=BNfQltu1cqcoxem7Gy9RKTVJpbL1vC/3tkqs3QQWnj+8HKhDNFNDf1VIJqn1ts5nHXou
 AeOuXptoineDTSvURAnsBZ2HqFFAWFaUKJmjII5D17Vm8LrZ9++cS9ck7kf7u/ULqoTc
 us1fZyCf/j1zEoKEDAKFlMJt7Pq6PW1x+1o54I783uL3ltPwRlEGhl53CHe1H4dVueKp
 Vust4mj09fWUL/HYwFopfgsmq8WhX7XsFzU+RdvpTuMUrmOezA5O5IYXBxXXR/SalvN9
 4mbMTbFJqxVzgGh8w9lJrT14dvidqbsqEfZtt4X6W7h/CDgVN9Ad+UbK/eP8X9KFi4eP qQ== 
Received: from mail.wago.com ([217.237.185.168])
        by mx08-005c9601.pphosted.com (PPS) with ESMTPS id 3ew6yxk4jr-4
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 22 Mar 2022 16:23:20 +0100
Received: from SVEX01010.wago.local (10.1.103.228) by SVEX01011.wago.local
 (10.1.103.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Tue, 22 Mar
 2022 16:23:14 +0100
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (10.1.103.197) by
 outlook.wago.com (10.1.103.228) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21 via Frontend
 Transport; Tue, 22 Mar 2022 16:23:14 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIr2Txv5lX2zmG4wULcRPLMuxeD642t3hdI3xaNtSeb0CDDs7u6JW2nniE0RAejp42h6gSrQ5gIQZvDefEXOPSbph8rd2wApjbIIoh/rrvE7iDJUdvQEf5I4G8yUTXC/aNbMKadivAX/mTAOpRQDLqW+5y8F4itaxZwXxRg2PGlN146U12z1XP2NVtGvi3DhyAyh23rs0LCWOzhTdo46Ke+FGHlqJYGTPMG91PFVBR8k/H6A81sBJYYF2HqlqbwcSxpO8CsnI2N/HwWEcj2CzlUMhJnvMp0WTRJ0PiYc204hOo9nRBwpcOpA0CX0hfIXwG4z0nvEECHN8WA6ncSPdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVdKBTeAjIeB7/kGxyoFilfNibCnrSyGT5vkY/jNodw=;
 b=DKD14bIT2Fxka/u8Tzd0YTvyNvst3Y2saAhANdtDXeX5cOHuNsQmeprm2JWD7cWtHysUIMoRoCEabJFydOJBt07/dNIfU8gyV9hMKZworpKsu3kO0u9YyZ/5LGZSU7ZLN7KFobURAEeB72AoiGz+KDgrUQfRAQcazqK6fX5F9/qccTtTpOJCxFV6qwS1WHixjj8XqggpsNF3CGpJt5FdQJ5ANm93BQOd/yD6Kw8NL75087xL326zCeOiahhW5kjLZnGUCnZVmz1qPftvI9TmSl3hD9Haxnb+W4juniADlR341HOZ04FkONMU/F/Yzo8JoH8wmilij5jUZ1O5DjZ4Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wago.com; dmarc=pass action=none header.from=wago.com;
 dkim=pass header.d=wago.com; arc=none
Received: from DB8PR08MB5097.eurprd08.prod.outlook.com (2603:10a6:10:38::15)
 by AM6PR08MB3048.eurprd08.prod.outlook.com (2603:10a6:209:46::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 22 Mar
 2022 15:23:13 +0000
Received: from DB8PR08MB5097.eurprd08.prod.outlook.com
 ([fe80::cc57:a7c3:cf03:e4cb]) by DB8PR08MB5097.eurprd08.prod.outlook.com
 ([fe80::cc57:a7c3:cf03:e4cb%6]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 15:23:13 +0000
From:   =?utf-8?B?U29uZGhhdcOfLCBKYW4=?= <Jan.Sondhauss@wago.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH] drivers: watchdog: omap_wdt: ensure working trigger
 pattern
Thread-Topic: [PATCH] drivers: watchdog: omap_wdt: ensure working trigger
 pattern
Thread-Index: AQHYPcgpzFMATYhehkq/vc00jmQNS6zLWUyAgAAsoAA=
Date:   Tue, 22 Mar 2022 15:23:12 +0000
Message-ID: <c67f7608-1343-1f51-1554-d95abb17eaae@wago.com>
References: <20220322083754.50322-1-jan.sondhauss@wago.com>
 <42d866cd-c781-5c2a-7f4f-c33cba954843@roeck-us.net>
In-Reply-To: <42d866cd-c781-5c2a-7f4f-c33cba954843@roeck-us.net>
Accept-Language: en-DE, en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d9aeea2-18cb-4059-5056-08da0c17e159
x-ms-traffictypediagnostic: AM6PR08MB3048:EE_
x-microsoft-antispam-prvs: <AM6PR08MB30486FE040B028B4B1BE6E288A179@AM6PR08MB3048.eurprd08.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i2LYqYi/mb8+a6kTl2faQyYUJlSDcYNSWCNRRbXlM0SSPmvW3HUlXqRvdjuBGHwcZxn+lLiEycTYkUnsWoGizrkdhfzc1ZbjxY9g1F8SO/42pkqIYH1D6s9TUj0FMBF4qi5nsPb7n068t3WUORJj731Cbn7LuXud0iRjEN1Pk9IMdlMxMdY/ExLGDRhjTRKnlGFv8zh2akZN4eFJw5Ij8BjnQJRtQhAE47K5VMzoYcHOK+jUDM0fr86vUf3oflNU29CqWcPdfAenNFsH7vr1RzRf+lVUrDHSWWDQ9iubz1ShFKAG8rPM7WvcYslb9ulOHYmpXK3NTe4S4sEiQ0nLBw0E5IOShmah14GbOr3bBk4v2fLkrcGS0re+wh9Iz4qCAtOLjZczVJzaY8zK98IJadvFJv9oU3GqT0VK2m/4HrcauDgyXhfYTPGCqPA04cPHv6ieMEGR9ja/tC1okrNfP50WRSOzK9J/XT0XhEmgQyC5mLaOazNGIQOPdjnNAjkzcXmZfflR3OanPCl49JC8PbmxU4PZPMD1nNnMzdJi9wqbQePiaYf5pkByhOUzjr6d9VkFnTZCY9RuDkEEIoqrHD0U0R/PSC9eAdF0NA8lDFLZxbFgmqgpt0/h7JigBQdpy+CT4APRMkmnCKutMT/P6nb2/KkCo0EbObmCPAh4I7OyQTymH55yB1gHk6A8DWN+PPS11zVimWbx9m+m4tRhbL1DoIzjnu87BFTGSgONoxE0LRSVRuwHll8JtJ+NBeJU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5097.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(83380400001)(2906002)(86362001)(6486002)(508600001)(8936002)(38070700005)(5660300002)(31686004)(122000001)(186003)(2616005)(26005)(316002)(4326008)(36756003)(76116006)(66556008)(110136005)(66476007)(66946007)(64756008)(66446008)(31696002)(53546011)(6506007)(6512007)(71200400001)(91956017)(85182001)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEVmOTNPVlRoZnFaQlR0cWVJeXAwVWFDNWVoa21mQUZDd2I5NklEUG9nVmhU?=
 =?utf-8?B?MXpETlJCNHJMU2dQMzIweVo4enRHRHhodG5Pd2Npd3VMaWRxK0JERlh6RDhj?=
 =?utf-8?B?VDU2NnptaWV1bVBLVGVGZi9wdU41RmtOVVB6YVBwRUoxRkQyN0lNOTRCcFZ0?=
 =?utf-8?B?bDRxQ2E0WDdPQU5IUkVVZTJQUWpKSDBLQndheEdIRUlDSTdVczQ5bmIxNE4v?=
 =?utf-8?B?Sk5qczVneWJZU2xJVWhxWHlka3EyOWc4alErWVFhZ1VBNm9ZNUk2amlQQ05m?=
 =?utf-8?B?eXZNQWhCUDliZ0tINmJvYlJtd2FWVmxSZVFtSjBiVmphTUIrcUwrL1lNZU4x?=
 =?utf-8?B?aStZeEhJb1dVTnlOaWlVMjBWa1FOSXh1K1JwbGhBem9vaXdHYkcyOWRaMi9y?=
 =?utf-8?B?azFaaDZSOFdGTUUvTlVUUzdTVzZBTmk1em8vamttbVVIcktyVmNGWm1XZ1JW?=
 =?utf-8?B?eDgrUm5PMFhwUk5jdlFKODhWWHBBSWVIVHE4R0tLS21ieHpLdGR0NFZvOElT?=
 =?utf-8?B?enlGenlmTjhzNko2RmRIeHg0OEYyMlNXZnBHSmppRkJHcWIvWmZ6WlJMYyt4?=
 =?utf-8?B?OS8xNHJFaCs0di9zSURtWHQ2cGMvdUNQSFRvR2RPbmw1enMrOWk2QkxEUGlU?=
 =?utf-8?B?b3V4RnJyVHRCcVIwWGorSVBkS1g5dHgvOW9GUCtOVDluVURyMllZazZ0d0VI?=
 =?utf-8?B?ZTdITStHTSswYVhoaXM3bnVXRUdyMEp2elhyRUZPb0JoWDFwOTJYSzd4aHJo?=
 =?utf-8?B?V3pRVzQ5Ym5xWFJ1dEIzY0RIakNBbGd4VlQ2Qmh0Z1NqYUVOM0dnY0hwYjd6?=
 =?utf-8?B?UzdjZWpKWFBwVnNLVVBJK1ZTejRrQzNIN2hETFdPbGJYRTgxL0d2dVR5OHA2?=
 =?utf-8?B?eDZFVUptZ2d2RDdzcCtTUDlQOWlNZzJPSkN4eTBGdzZTOWE1WG1kU1RlQUVZ?=
 =?utf-8?B?eFZ5UzZwcG1aNGhHRVFRNTgvVEhrVzQrSU0rbmxEazlMY3dPQlNpWTFBMitw?=
 =?utf-8?B?OUVxMmNFRSt3ZmxMNTRDS3VWWGhCZDVndVRPYUQ2d1ovWmVvR2ttNG5TZW53?=
 =?utf-8?B?RHUvb3k4aXgwSzY1Q2xRODlqTU9STlE5ZTR6dVk4NUtZZUtKNWFLQXU0Q0VZ?=
 =?utf-8?B?ay9HZVVKcmRBcW1HUFlBN3hMckFZV2tpT3FnWWxjdGNrb2NvQ0trZWpuampT?=
 =?utf-8?B?SFZkU0RPV1dwbEFDTDBTc0k2OFhnWXZmd0JvVnhYOXBldVN2b3NaS2xMbmQz?=
 =?utf-8?B?c1ZuNlYvOU9ua1M5ck05eUJlT3ZLa1BacitHcnc5RGd1K25FZkp0cmlibDM4?=
 =?utf-8?B?S3FKOXJOZkxTYThpdGpsZ2RVSGtvWkRMVmJkVXpxVVpPelZSS0pGVHBEbEdw?=
 =?utf-8?B?eXZGaE0wd2RBeUNiaXRRVDVta2hoSlBtWGJ0OVN2NWlvQnI0eHFYdjBweHJx?=
 =?utf-8?B?cUdMWFREMkZWeTI5NkJ5Z1NmOXRhRTFlbTZqaTJMMmtmSG5QczdnSXF5Umoy?=
 =?utf-8?B?dlo5RjJJMlRIeGtGU3RGbmRSdklxUTVQYms4THEydXE1bmlTU2lmMDhraDR1?=
 =?utf-8?B?d1JjK0RGZWY4TEVKSzFYRjVhcUxDM1M2WmwvRnNoczdQQWlYTk5wK05xNE14?=
 =?utf-8?B?dExMZGdNaVZsd2dwZHpLNVB2QXNLWlJGUEE3Mmo1Qm1qWkhNNUQzRmVLejBH?=
 =?utf-8?B?Qm82TW9DUlBSOFo3Y25rcjNpclVmeEJmTE52bmRrd0N1Q0FoUW9vZzBwK3Bl?=
 =?utf-8?B?bjZpWXFEVGRReGtCeWtpVGxJWWxqakh1TmFBOXdrUFVSSUQ1dXg3Q0VvR0J5?=
 =?utf-8?B?TGk4VWwyVkFuSi9tL2JYd2YxOTI2OGVGZDZBU2IzcitPQS9FbkJIN25xWmlY?=
 =?utf-8?B?VGxna2hDRGhQSGdYWEhndFBWRWNxT0VxcG5iSGhuS1YwaDBqVllPa3pENzgy?=
 =?utf-8?B?N3p0R3B5c0tOSmVuZ1piQUd6MEdicVMrNURGSUMvdTJKb0ZRc3pYZ3g0TmpT?=
 =?utf-8?B?U1Z2S1lvRGhnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90BAD0011A5D2C48892BC713D36F8E2C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR08MB5097.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9aeea2-18cb-4059-5056-08da0c17e159
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2022 15:23:12.8979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e211c965-dd84-4c9f-bc3f-4215552a0857
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y5ila6soS7OqvLK3Xxc9C6r8YiU0syA4jfiE8+IkqH6UCQGBNB37guHi+ZQ8puNflytp7j+hSxXrm1NG7nNFbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3048
X-OriginatorOrg: wago.com
X-KSE-ServerInfo: SVEX01011.wago.local, 9
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 22.03.2022 14:00:00
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-Proofpoint-GUID: NqHKAfvbZu3M7nh2BOVVFR0XFkZEo6Ez
X-Proofpoint-ORIG-GUID: NqHKAfvbZu3M7nh2BOVVFR0XFkZEo6Ez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_07,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203220088
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQoNCk9uIDIyLzAzLzIwMjIgMTM6NDMsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+IE9uIDMvMjIv
MjIgMDE6MzgsIFNvbmRoYXXDnywgSmFuIHdyb3RlOiA+IFdoZW4gdGhlIHdhdGNoZG9nIGlzIA0K
PiBpbml0aWFsaXplZCBhbmQgdHJpZ2dlcmVkIGJlZm9yZSB0aGUga2VybmVsIHJ1bnMsID4gaXQg
bXVzdCBiZSBlbnN1cmVkIA0KPiB0aGF0IHRoZSBrZXJuZWwgdXNlcyBhIGRpZmZlcmVudCB0cmln
Z2VyIHBhdHRlcm4uID4gT3RoZXJ3aXNlIHRoZSANCj4gd2F0Y2hkb2cgY2Fubm90IGJlIGtpY2tl
ZC4gPiBaalFjbVFSWUZwZnB0QmFubmVyU3RhcnQNCj4gVGhpcyBNZXNzYWdlIElzIEZyb20gYW4g
RXh0ZXJuYWwgU2VuZGVyDQo+IFBsZWFzZSB1c2UgY2F1dGlvbiB3aGVuIGNsaWNraW5nIG9uIGxp
bmtzIG9yIG9wZW5pbmcgYXR0YWNobWVudHMhDQo+IFpqUWNtUVJZRnBmcHRCYW5uZXJFbmQNCj4g
DQo+IE9uIDMvMjIvMjIgMDE6MzgsIFNvbmRoYXXDnywgSmFuIHdyb3RlOg0KPj4gV2hlbiB0aGUg
d2F0Y2hkb2cgaXMgaW5pdGlhbGl6ZWQgYW5kIHRyaWdnZXJlZCBiZWZvcmUgdGhlIGtlcm5lbCBy
dW5zLA0KPj4gaXQgbXVzdCBiZSBlbnN1cmVkIHRoYXQgdGhlIGtlcm5lbCB1c2VzIGEgZGlmZmVy
ZW50IHRyaWdnZXIgcGF0dGVybi4NCj4+IE90aGVyd2lzZSB0aGUgd2F0Y2hkb2cgY2Fubm90IGJl
IGtpY2tlZC4NCj4+IA0KPj4gUmVhZGluZyB0aGUgY3VycmVudCBjb3VudGVyIHJlbG9hZCB0cmln
Z2VyIHBhdHRlcm4gZnJvbSB0aGUgd2F0Y2hkb2cNCj4+IGhhcmR3YXJlIGR1cmluZyBwcm9iaW5n
IG1ha2VzIHN1cmUgdGhhdCB0aGUgdHJpZ2dlciBwYXR0ZXJuIGlzIGRpZmZlcmVudA0KPj4gZnJv
bSB0aGUgb25lIHByZXZpb3VzbHkgdXNlZC4NCj4+IA0KPiANCj4gSXQgaXMga2luZCBvZiBhbm5v
eWluZyB0aGF0IHUtYm9vdCB1c2VzIHRoZSBzYW1lIHRyaWdnZXIgcGF0dGVybi4gUXVlc3Rpb24N
Cj4gdGhvdWdoOiBXaGF0IGhhcHBlbnMgaWYgdGhlIHJlZ2lzdGVyIHdhcyBub3QgaW5pdGlhbGl6
ZWQgYnkgdGhlIFJPTSBtb25pdG9yDQo+IGFuZCBjb250YWlucyB0aGUgcG93ZXItdXAgdmFsdWUu
IElzIHRoZSBjaGlwIG9rIHdpdGggdXNpbmcgdGhhdCBhcyBiYXNlID8NCg0KSW4gdGhlIGN1cnJl
bnQgaW1wbGVtZW50YXRpb24gdGhlIHZhbHVlIGlzIG5lZ2F0ZWQgYmVmb3JlIHdyaXRpbmcgdG8g
dGhlIA0KY2hpcC4gQWZ0ZXIgcmVzZXQgdGhlIHJlZ2lzdGVyIGNvbnRhaW5zIDAuIEluIHRoaXMg
Y2FzZSB0aGUgZHJpdmVyIHdvdWxkIA0KYWx0ZXJuYXRlIGJldHdlZW4gfjAgYW5kIDAuDQogRnJv
bSB0aGUgdGVjaG5pY2FsIHJlZmVyZW5jZSBtYW51YWwgKFNQUlVINzNQKTogV3JpdGluZyBhIGRp
ZmZlcmVudCANCnZhbHVlIHRoYW4gdGhlIG9uZSBhbHJlYWR5IHdyaXR0ZW4gaW4gdGhlIFdhdGNo
ZG9nIFRyaWdnZXIgUmVnaXN0ZXIgZG9lcyANCmEgd2F0Y2hkb2cgY291bnRlciByZWxvYWQuDQoN
CkFzIGZhciBhcyBJIGNhbiB0ZWxsIGl0IHNob3VsZCB3b3JrLiBCdXQgSSBqdXN0IG5vdGljZWQg
YSBkaWZmZXJlbnQgDQpwcm9ibGVtIHdpdGggbXkgcGF0Y2g6IFRoZSBhY2Nlc3MgdG8gdGhlIHdh
dGNoZG9nIGhhcHBlbnMgYmVmb3JlIHRoZSANCmhhcmR3YXJlIGlzIGVuYWJsZWQgdmlhIHBtX3J1
bnRpbWUgZW5hYmxlLiBTbyBpbiB0aGUgY3VycmVudCBzdGF0ZSB0aGF0IA0KY291bGQgbGVhZCB0
byBhbiBhY2Nlc3MgdmlvbGF0aW9uLi4NCg0KPiANCj4gSWYgbm90IGl0IG1pZ2h0IGJlIGVhc2ll
ciB0byBqdXN0IHVzZSBzb21lIG90aGVyIHBhdHRlcm4gbGlrZSAweGZlZWRmYWNlDQo+IG9yIGV2
ZW4gc29tZSBwc2V1ZG8tcmFuZG9tIHZhbHVlLg0KDQpUaGUgd291bGQgYmUgZWFzaWVyIGluZGVl
ZC4gVGhlIGlkZWEgYmVoaW5kIHJlYWRpbmcgb3V0IHRoZSBjdXJyZW50IA0KdmFsdWUgaXMgdGhh
dCBtYXliZSB0aGUgZHJpdmVyIGNvdWxkIGdldCBjb3BpZWQgZnJvbSB0aGUga2VybmVsIGFnYWlu
Lg0KDQpXaGF0IGRvIHlvdSBzdWdnZXN0IGFzIGEgVjIgcGF0Y2g/IFdoYXQga2luZCBvZiB0ZXN0
aW5nIHNob3VsZCBJIA0KcHJvdmlkZT8gSSBvbmx5IGhhdmUgYSBhbTMzNXggc29jIGF0IGhhbmQu
DQoNClRoYW5rcywNCkphbg0KDQo+IA0KPiBUaGFua3MsDQo+IEd1ZW50ZXINCj4gDQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gU29uZGhhdXNzIDxqYW4uc29uZGhhdXNzQHdhZ28uY29tPg0KPj4gLS0t
DQo+PiAgIGRyaXZlcnMvd2F0Y2hkb2cvb21hcF93ZHQuYyB8IDEwICsrKysrKysrKy0NCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4gDQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9vbWFwX3dkdC5jIGIvZHJpdmVycy93YXRjaGRv
Zy9vbWFwX3dkdC5jDQo+PiBpbmRleCA3NGQ3ODViMmI0NzguLjY4MGEzNDU4ODQyNSAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvb21hcF93ZHQuYw0KPj4gKysrIGIvZHJpdmVycy93
YXRjaGRvZy9vbWFwX3dkdC5jDQo+PiBAQCAtODUsNiArODUsMTMgQEAgc3RhdGljIHZvaWQgb21h
cF93ZHRfcmVsb2FkKHN0cnVjdCBvbWFwX3dkdF9kZXYgKndkZXYpDQo+PiAgIAkvKiByZWxvYWRl
ZCBXQ1JSIGZyb20gV0xEUiAqLw0KPj4gICB9DQo+PiAgIA0KPj4gK3N0YXRpYyB2b2lkIG9tYXBf
d2R0X2luaXRfdHJncl9wYXR0ZXJuKHN0cnVjdCBvbWFwX3dkdF9kZXYgKndkZXYpDQo+PiArew0K
Pj4gKwl2b2lkIF9faW9tZW0gICAgKmJhc2UgPSB3ZGV2LT5iYXNlOw0KPj4gKw0KPj4gKwl3ZGV2
LT53ZHRfdHJncl9wYXR0ZXJuID0gcmVhZGxfcmVsYXhlZChiYXNlICsgT01BUF9XQVRDSERPR19U
R1IpOw0KPj4gK30NCj4+ICsNCj4+ICAgc3RhdGljIHZvaWQgb21hcF93ZHRfZW5hYmxlKHN0cnVj
dCBvbWFwX3dkdF9kZXYgKndkZXYpDQo+PiAgIHsNCj4+ICAgCXZvaWQgX19pb21lbSAqYmFzZSA9
IHdkZXYtPmJhc2U7DQo+PiBAQCAtMjM4LDcgKzI0NSw2IEBAIHN0YXRpYyBpbnQgb21hcF93ZHRf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+ICAgDQo+PiAgIAl3ZGV2LT5v
bWFwX3dkdF91c2Vycwk9IGZhbHNlOw0KPj4gICAJd2Rldi0+ZGV2CQk9ICZwZGV2LT5kZXY7DQo+
PiAtCXdkZXYtPndkdF90cmdyX3BhdHRlcm4JPSAweDEyMzQ7DQo+PiAgIAltdXRleF9pbml0KCZ3
ZGV2LT5sb2NrKTsNCj4+ICAgDQo+PiAgIAkvKiByZXNlcnZlIHN0YXRpYyByZWdpc3RlciBtYXBw
aW5ncyAqLw0KPj4gQEAgLTI1Myw2ICsyNTksOCBAQCBzdGF0aWMgaW50IG9tYXBfd2R0X3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+PiAgIAl3ZGV2LT53ZG9nLnRpbWVvdXQg
PSBUSU1FUl9NQVJHSU5fREVGQVVMVDsNCj4+ICAgCXdkZXYtPndkb2cucGFyZW50ID0gJnBkZXYt
PmRldjsNCj4+ICAgDQo+PiArCW9tYXBfd2R0X2luaXRfdHJncl9wYXR0ZXJuKHdkZXYpOw0KPj4g
Kw0KPj4gICAJd2F0Y2hkb2dfaW5pdF90aW1lb3V0KCZ3ZGV2LT53ZG9nLCB0aW1lcl9tYXJnaW4s
ICZwZGV2LT5kZXYpOw0KPj4gICANCj4+ICAgCXdhdGNoZG9nX3NldF9ub3dheW91dCgmd2Rldi0+
d2RvZywgbm93YXlvdXQpOw0KPiA=
