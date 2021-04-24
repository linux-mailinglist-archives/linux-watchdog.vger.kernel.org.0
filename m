Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF2A136A254
	for <lists+linux-watchdog@lfdr.de>; Sat, 24 Apr 2021 19:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbhDXRWG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 24 Apr 2021 13:22:06 -0400
Received: from mx07-001d1705.pphosted.com ([185.132.183.11]:50786 "EHLO
        mx07-001d1705.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230230AbhDXRWG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 24 Apr 2021 13:22:06 -0400
Received: from pps.filterd (m0209326.ppops.net [127.0.0.1])
        by mx08-001d1705.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13OHJ0lI023816;
        Sat, 24 Apr 2021 17:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=S1;
 bh=BiEEGeIf7lWRAKXiu/TtQFodijFqjPbG00f08WkVbbQ=;
 b=neVpB9raQt4JWJojt64K2/bbHYVhKp/Rtb3DbH7Fv0R7CG/J7KeJOZDoHqP2d5ausTJq
 pMvgmiFDjPSNZw4Hw73VBGoSgt926OLBP9rlKQ5IS/Ajb7u6ZHuJIeUjWzxJeWVAS6zt
 Kag7pv9+7gpD7K3uT281XsdhhwN7scIzMKqijxCsID/2OWTS01TMqv9tMKRJIV11S1B9
 k4LN2NKL/0c0q4ieZ1NDkuqHh8q21jF1/8Sa3MmVW5RArl8GIflgprX7a3zwy33Qcc/6
 R2Bfiv9PHZLrnYL+6gvxKNFIDPsclMmMyr5oxlnv7PO+Y5+BxbQiyISEOdRxjPNzu3Ds Rw== 
Received: from eur04-db3-obe.outbound.protection.outlook.com (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52])
        by mx08-001d1705.pphosted.com with ESMTP id 3849hk09te-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 24 Apr 2021 17:21:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epLfgwVqrWGy2BsEFlVggnR7Dbkdtv2Ed7nZkfvkxFT3x814DT/4tYOA+H7nkaQcD0dKFewMI9YS3+NisJPUgPXseHRlXVh8cHWdLhjNB0r8oTm52nfH+B+rQSokPogniQ95+W8+ar4/48ZgDTwfBEBMwZGaAm/ed7acbAnCeC0tL2bteBYyPDa781WDSHcG2B9MXPfxy+C+2kUyAdjhVOxqERD1TcDJJNRCVSTUnLDiF9ubky/MXDeJNsdzjcLWgnCgb5v3O9Vr8NHJ/OvbjGP0WERDp04tOR8VBz0THgSj0QKEPmcMp2tuHSX5iSO4w1BiUWXPwx1HfSAIQJ39kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiEEGeIf7lWRAKXiu/TtQFodijFqjPbG00f08WkVbbQ=;
 b=HeY5XUiGqdY/pTOTzGcMTbqSuAhqjIMQlTR/XzSVQvQTjRtIEmne39kqZpzs4C1Ow7wLKhVypJsTCdOXojB1lA5V5sEqZUt01sDp1tZhvNGs6FgbSPzHzh1jgh4E1wt3tSPwNToAOnDHE9gl6yClQPPiQoOMI+dMY2Uz3J2FJWxC1JC/OLSudyX5t/LPLhF9qIdMsrzZr1jxbAYu1vEKoEhAe1qPuaTHuERRjt4ripllPy5Q3OF+SbLALNkwm3tqVno3qmxkSFL84Vz9O8vnAnZyMtYoD9QlaFpHddFF2jcW89G/dsuKmuWNQPd0MY7qUqCFo8APqRVAvs1DCK2gJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from AM9P193MB1491.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:306::20)
 by AM8P193MB1028.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1eb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Sat, 24 Apr
 2021 17:20:47 +0000
Received: from AM9P193MB1491.EURP193.PROD.OUTLOOK.COM
 ([fe80::35b3:3e5e:6533:84e0]) by AM9P193MB1491.EURP193.PROD.OUTLOOK.COM
 ([fe80::35b3:3e5e:6533:84e0%5]) with mapi id 15.20.4065.025; Sat, 24 Apr 2021
 17:20:47 +0000
From:   <Peter.Enderborg@sony.com>
To:     <linux@roeck-us.net>, <wim@linux-watchdog.org>,
        <akpm@linux-foundation.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        <shakeelb@google.com>
Subject: Re: [RFC PATCH] watchdog: Adding softwatchdog
Thread-Topic: [RFC PATCH] watchdog: Adding softwatchdog
Thread-Index: AQHXOPRHJMESqgFAQEC7n9VkV8fdEqrDve8AgAAM14CAABvbgIAAA8kA
Date:   Sat, 24 Apr 2021 17:20:46 +0000
Message-ID: <a6b6c73b-4b6b-a3cf-4fa1-d62c01b94c3c@sony.com>
References: <20210424102555.28203-1-peter.enderborg@sony.com>
 <20210424102555.28203-2-peter.enderborg@sony.com>
 <d5db5606-f074-6d0e-2316-8ff41af25cfd@roeck-us.net>
 <ed9e0944-fc75-6705-98ea-3f6cf86f5053@sony.com>
 <ded189ad-6c94-1063-45f8-1818462b7c69@roeck-us.net>
In-Reply-To: <ded189ad-6c94-1063-45f8-1818462b7c69@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=sony.com;
x-originating-ip: [37.139.156.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea628d06-11cf-4ffc-29d6-08d907454cb0
x-ms-traffictypediagnostic: AM8P193MB1028:
x-microsoft-antispam-prvs: <AM8P193MB1028188AB8515EDC3DA4493986449@AM8P193MB1028.EURP193.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aHaAKkcpXe4FSRrKsjaxJanEKoG7rtTLpvMvdRu4YJu257nqvIhAnbjV7vgOCPGILObIGoJ5HyXXIPmLFUmYNM637eeDAiTHnZsbDrr4zVqX3ox0I3fNaWSKi+oslbSBq5YFmH2AYMPl+uJKuW9RhnTKJhEyTpWyCVFWgXeWX8zEXyohzVxsRhvi5I3UAqMPkvvEYps1z5aa2czLSu+48TIpxdmDbfW+MgRWev+UtCrN9S8Jh/c7a42x7ziqGZY7p308U8eyAeETbx0FzHif/DRX2kkZ/BXXAMtE8JRc7+f6pSdZOeZ99+lJOIPlSczJQFGaiDEalIKbkesOlkpfKG8Vpc4PX1pmHmwGr9eRNq2090JDqlgNiJuaVqXg2CcH/LmvCIx7UztuSg3fIT1vBS16Q6FAEYv6X3owt1y8M1wpu8TerMSB5ZxAguogTpukU4PQ2qKBex/w4PHg3RzJTc3VqY7ywFvdA1gJXRdTazhXYmJsTAEjKr5ZJKH1v8qap5D5u654IEosbFnSl7xZmdPpI9tUUWe9qftVzdtEbcWSxs7U51392tmNNMgt5kEhj93FK3hqRtr2fQ9WMlU9FjUteTHiK3DFtM5tSBcM5HWVvzsoUkpThkU3xBOlVbtyhxtxejSEEGHpnk+IcF3meqDC6qhjOxWm9KY22Ki7E4CzSc0IUq96MNjwy5fXM1hn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB1491.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39840400004)(366004)(376002)(71200400001)(38100700002)(83380400001)(2906002)(66446008)(53546011)(6506007)(8936002)(122000001)(36756003)(316002)(478600001)(66476007)(76116006)(91956017)(64756008)(66556008)(66946007)(5660300002)(8676002)(31686004)(86362001)(6486002)(2616005)(6512007)(26005)(31696002)(110136005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MzVsbWRXNUx4RnBIdTBKTjgxK3o1Y21DeTAwd2ZOR1pnRDh1R2k2Z3RQOHQy?=
 =?utf-8?B?S1dRMlBGU1dhUTdWL3BWUkdGNHp6RlU1SEpOdGl3VDlVckZIM0MrclIzUVND?=
 =?utf-8?B?YTJjRGR4ZVpLdTQ1Z0JaaHU2ZUpOaWRjWWdBTmM4YnR3OTZIejBZalhSNHgz?=
 =?utf-8?B?Rk55SzVxWUNyb3hlVGVUU2ZKRnNoMEg1bCtuaWZCNnhNMFM2VW4ycWtFb0ZF?=
 =?utf-8?B?UnJ4elVpbTEwbUlDeG5uZ2RnQmYyUStRb0hqSE5OR3ZiZkJGNXAraHd3bkd6?=
 =?utf-8?B?V2o2d3NFdU9JWEZJbnUvang1b3pYY25HTzV3MWZ1QUJVWnNlSGJXY3dSOVA4?=
 =?utf-8?B?N0Z3eVdTSTh6Q1dMcFJCZ1JKcktGMjVhUnppajUwOGRjdWtyNkh4VFpBY3hC?=
 =?utf-8?B?eHJkRGljVE8zM1hCWG0rdmFkbjRudFRWRk1oMlRWQTBpbWtQeWFQcng5c0tT?=
 =?utf-8?B?aHZYSm0xalpmbVY2endmRitpaWpwUTZrNUxXR2U1c1c2YTk4NEltZFMrNmRT?=
 =?utf-8?B?OFpQaDhxWG1PZnp4UCs0RXQralBsemxtS1I0N0h4S2JRVUFQKzg2MGIrQ3F0?=
 =?utf-8?B?VHIraE5XSzNVRjl4bno5Z3Z1WjFLeWZPL1J4WDcxdlBIR0JWejlmVVUzdzJx?=
 =?utf-8?B?c081cnU2OVZITEJsS25CS3liT3pnRjM4SUorRlpTRVN0L1JvUDUrOW5DOW41?=
 =?utf-8?B?WTNYQWtMQzE3SFFndElBYWJnbjZBcGM0UXVjNVREK05ET0lidmNNMlU0M2Zh?=
 =?utf-8?B?ZjRlc2lFZGZZM2YzenJWeHR4WTFlU3lpTmE5TFowQnZWQjVoUnEvVzFJaHN6?=
 =?utf-8?B?QmVndFFBUVdmMVpMSUdhVzBXeWNTdHJPdDBiT0NlVVczaHpMZHRlOTNHRTBq?=
 =?utf-8?B?bkhaQnNzVjRVYlA0Y1AzemRWWmF5R2RsdmdYSnZISlRGUnFsKzRrbjN4bVR1?=
 =?utf-8?B?OW1rVE5XaGFldVVEWkJMUkMxZytlVXp4clJVdmJIT2hEVjV1Z1pXckpjeVY0?=
 =?utf-8?B?ZnkxK0JVbXh4bWhPM0VPWmEvQ2p3bVJKSDluMm1zNTh3T2lha2VGYi85Zk5v?=
 =?utf-8?B?YjUrTGZlb3dkWW5WZ1JuNjc2dXA4Rytwc2tHWTJIOVZyQzNidm5iY2FnQ2Iz?=
 =?utf-8?B?bGZPcVBwT3R0T2FTaG10bk1ZMXlwanZnTzNnSTlMbVl4bXJNMmtTVnd5RXpQ?=
 =?utf-8?B?VU85S1JUd2dTd2dHekM4Q2RoMU1UV2p2YkJaRXNDSUI2WTJyT1RPcXlURWJD?=
 =?utf-8?B?dEFPL1MwWTZ6cHpWbkMzNFlYRWVRZmxCTG84UHVuZnJLcHNaM0V0ZWxNc2Ex?=
 =?utf-8?B?SzR1d0FrY09tb0hTOTl6b2gxVmhlVVBkVjBEdnBzUHFVRnNwOFFMQnZIeUEx?=
 =?utf-8?B?dTFGTGJYb3BPOUNNbkdxZDhSVjAyb0JDd3p3VEljdDlVZnZtQTBFcU41R3Iy?=
 =?utf-8?B?Y0MzMlZOenJESmFPc0ZteDZzMVpITDdwMVkvMlIyNVF3Q3NMSk0wdHBGTjZO?=
 =?utf-8?B?R1BOL0VJaUpNVHh1ZVU0aGFpUUhKR3pNa3FnTUdqUUhPRDh0QStsMnFjQVBk?=
 =?utf-8?B?MFZrSklqT1U0SXpRYnJjOEZiSU9RYjRXalVrVFlhVGRpZy9jRHBxenRJdnlV?=
 =?utf-8?B?NXlMV1l4Ym5saTQrV2RjQzR5NlZyVmZSZlFjYnNOSzZMZHYxckpJdUNxdk43?=
 =?utf-8?B?c3cxT092dTRYalNjUGN4MW1WT1Zvak5BRWtqR2VpdUF0TVFsMXJoMEUvK0lz?=
 =?utf-8?Q?U6qygxQT8F1SMbPQEmSGq3TLFXUxHuDKFCaWpLS?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE7A398D0DF25742AA1149199D46410F@EURP193.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1491.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ea628d06-11cf-4ffc-29d6-08d907454cb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2021 17:20:46.8176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VAm+6COk8zizNkOiiI51yiZt8v4OoREv/GJJ6Tzo8ALmo6Ya9r90ZKSNWU9riCaH48VhCos8NjUq3J0spnvGOq3ZENkCyLPkPn0+BQBDQgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P193MB1028
X-Proofpoint-ORIG-GUID: 3h6Vbp6gGfDj4iSOjhpNa8wQo2pfe4yJ
X-Proofpoint-GUID: 3h6Vbp6gGfDj4iSOjhpNa8wQo2pfe4yJ
X-Sony-Outbound-GUID: 3h6Vbp6gGfDj4iSOjhpNa8wQo2pfe4yJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-24_06:2021-04-23,2021-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104240130
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gNC8yNC8yMSA3OjA3IFBNLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiBPbiA0LzI0LzIxIDg6
MjcgQU0sIFBldGVyLkVuZGVyYm9yZ0Bzb255LmNvbSB3cm90ZToNCj4+IE9uIDQvMjQvMjEgNDo0
MSBQTSwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4+PiBPbiA0LzI0LzIxIDM6MjUgQU0sIFBldGVy
IEVuZGVyYm9yZyB3cm90ZToNCj4+Pj4gVGhpcyBpcyBub3QgYSByZWJvb3Rpbmcgd2F0Y2hkb2cu
IEl0J3MgZnVuY3Rpb24gaXMgdG8gdGFrZSBvdGhlcg0KPj4+PiBhY3Rpb25zIHRoYW4gYSBoYXJk
IHJlYm9vdC4gT24gbWFueSBjb21wbGV4IHN5c3RlbSB0aGVyZSBpcyBzb21lDQo+Pj4+IGtpbmQg
b2YgbWFuYWdlciB0aGF0IG1vbml0b3IgYW5kIHRha2UgYWN0aW9uIG9uIHNsb3cgc3lzdGVtcy4N
Cj4+Pj4gQW5kcm9pZCBoYXMgaXQncyBsb3dtZW1vcnlraWxsZXIgKGxta2QpLCBkZXNrdG9wcyBo
YXMgZWFybHlvb20uDQo+Pj4+IFRoaXMgd2F0Y2hkb2cgY2FuIGJlIHVzZWQgdG8gaGVscCBtb25p
dG9yIHRvIHByZWZvcm0gc29tZSBiYXNpYw0KPj4+PiBhY3Rpb24gdG8ga2VlcCB0aGUgbW9uaXRv
ciBydW5uaW5nLg0KPj4+Pg0KPj4+PiBJdCBjYW4gYWxzbyBiZSB1c2VkIHN0YW5kYWxvbmUuIFRo
aXMgYWRkIGEgcG9saWN5IHRoYXQgaXMNCj4+Pj4ga2lsbGluZyB0aGUgcHJvY2VzcyB3aXRoIGhp
Z2hlc3Qgb29tX3Njb3JlX2FkaiBhbmQgdXNpbmcNCj4+Pj4gb29tIGZ1bmN0aW9ucyB0byBpdCBx
dWlja2x5LiBJIHRoaW5rIGl0IGlzIGEgZ29vZCB1c2VjYXNlDQo+Pj4+IGZvciB0aGUgcGF0Y2gu
IE1lbW9yeSBzaXVhdGlvbnMgY2FuIGJlIHByb2JsZW1hdGljIGZvcg0KPj4+PiBzb2Z0d2FyZSB0
aGF0IG1vbml0b3Igc3lzdGVtLCBidXQgb3RoZXIgcHJvbGljeXMgY2FuDQo+Pj4+IHNob3VsZCBh
bHNvIGJlIHBvc3NpYmxlLiBMaWtlIHBpY2tpbmcgdGFza3MgZnJvbSBhIG1lbWNnLCBvcg0KPj4+
PiBzcGVjaWZpYyBVSUQncyBvciB3aGF0IGV2ZXIgaXMgbG93IHByaW9yaXR5Lg0KPj4+PiAtLS0N
Cj4+PiBOQUNLLiBCZXNpZGVzIHRoaXMgbm90IGZvbGxvd2luZyB0aGUgbmV3IHdhdGNoZG9nIEFQ
SSwgdGhlIHRhc2sNCj4+PiBvZiBhIHdhdGNoZG9nIGlzIHRvIHJlc2V0IHRoZSBzeXN0ZW0gb24g
ZmFpbHVyZS4gSXRzIHRhc2sgaXMgbW9zdA0KPj4+IGRlZmluaXRlbHkgbm90IHRvIHJlLWltcGxl
bWVudCB0aGUgb29tIGtpbGxlciBpbiBhbnkgd2F5LCBzaGFwZSwNCj4+PiBvciBmb3JtLg0KPj4+
DQo+Pj4gR3VlbnRlcg0KPj4gRG8geW91IGhhdmUgYmV0dGVyIGlkZWEgd2hlcmUgdGhlIHJlLWlu
dmVudGVkIHdoZWVsIG1pZ2h0DQo+PiBmaXQgYmV0dGVyIGlmIGl0IG5vdCBmb3Igd2F0Y2hkb2cg
QVBJPw0KPj4NCj4gVGhlIHdhdGNoZG9nIHN1YnN5c3RlbSBkb2VzIHN1cHBvcnQgcHJldGltZW91
dHMgYW5kIGEgdmFyaWV0eQ0KPiBvZiBjb25maWd1cmFibGUgcHJldGltZW91dCBub3RpZmllcnMu
IEEgcHJldGltZW91dCBub3RpZmllciB3aGljaA0KPiBpbnZva2VzIHRoZSBvb20ga2lsbGVyIG1p
Z2h0IGJlIHNvbWV0aGluZyB3b3J0aCBkaXNjdXNzaW5nLCB0aG91Z2gNCj4gaXQgd291bGQgcmVx
dWlyZSBhbiBhdWRpZW5jZSBsYXJnZSBlbm91Z2ggdG8gZGV0ZXJtaW5lIGlmIGl0IHJlYWxseQ0K
PiBtYWtlcyBzZW5zZSAoaW5zdGVhZCBvZiBpbXByb3ZpbmcgdGhlIGV4aXN0aW5nIG9vbSBraWxs
ZXIgaXRzZWxmKS4NCj4NCj4gQSBwb3NzaWJsZSBhbHRlcm5hdGl2ZSBtaWdodCBiZSB0byBpbnRy
b2R1Y2Ugd2F0Y2hkb2cgcHJldGltZW91dA0KPiBjYWxsYmFja3M7IHRoaXMgaGFzIGFjdHVhbGx5
IGJlIHByb3Bvc2VkIGluIGFub3RoZXIgY29udGV4dCBidXQNCj4gd2l0aG91dCB1cHN0cmVhbSB1
c2VyLiBUaGUgb29tIGtpbGxlciBjb3VsZCB0aGVuIHN1YnNjcmliZSB0bw0KPiB3YXRjaGRvZyBw
cmV0aW1lb3V0cyBhbmQgcGVyZm9ybSB0aGUgYWN0aW9uIHN1Z2dlc3RlZCBoZXJlIGlmDQo+IGEg
cHJldGltZW91dCBpcyBvYnNlcnZlZC4gQWdhaW4sIHN1Y2ggYW4gYXBwcm9hY2ggbWlnaHQgYmUg
d29ydGgNCj4gZGlzY3Vzc2luZyB3aXRoIGEgbGFyZ2VyIGF1ZGllbmNlLg0KPg0KPiBUaGFua3Ms
DQo+IEd1ZW50ZXINCg0KV2hhdCBzaG91bGQgYmUgYSBsYXJnZXIgYXVkaWVuY2U/IEkgaGF2ZSBp
bmNsdWRlIG1tIGFuZA0KbW0gbWFpbnRhaW5lciBhbmQgdGhlIGdsb2JhbCBsaXN0Lg0K
