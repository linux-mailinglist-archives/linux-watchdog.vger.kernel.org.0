Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F83471A8E
	for <lists+linux-watchdog@lfdr.de>; Sun, 12 Dec 2021 15:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhLLOIL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 12 Dec 2021 09:08:11 -0500
Received: from mail-tycjpn01on2122.outbound.protection.outlook.com ([40.107.114.122]:14635
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230079AbhLLOIL (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 12 Dec 2021 09:08:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFkhODA2R8YobpVVCPCBGWf+GhBvlp+DYMMeWsN8VKh4mpqcFtTsSzg5HwTSL37/DGg+dLxQaPTwmrRasE0Yd66R1EzCKCNfiIyOFbZ0x6FGH4cuu6LtC+hXAxwUEifvFxAKR4EyUwhdbZMhBo3FMzqgoCpW547EwR4naWI+hBRrBVoy/lcZFojCIbgPLGevXFtQYL+qnOXBuK6HWC/MD81LQq4fCBMSH8kvTRw1L5vCXCFR0HyMTe8Y6zZE6TTbg52DiGt/HeDOFWcKXY6iRjuKQMYyYB8UWYzjXEr+1gu2NfvjucMwhcroBEEQtOhE1FXQtdbDS0HNnw4KX5fvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WytzCn+2fQKRA9pD4pfNjViCZ+KNFc0cWLJKGODOYHE=;
 b=LZKVXLOBr/Pug8KEGBIpjUl4ksGnXl54EeizG65LQrLWC/o91q/Qbu+K4mQQbmY3J2AlQAwhEB/Wh5n3VWpAwpknHujzdWPpgKbV3R+33L/EjjpndJT/EZLE/qDXsbWeg5CdajuwRpusUtk8axsOPDC0hFa4+ikf1j26qBdkhoIIEuXNz+n4FhBzU/XY4UoIgzFuhB5bT70t75Hxd3orPX7jdR+f9fo38U6Iwvk6UGTbGfsPu7hXG9omlJY9Yn59NBnl6oevkPkB7ccexzxxosV+BzgIRFQJgb/Pnc3S1zAb6h3HTSej3H43zRiCcY/c/VYXKBM9h/t33R1zBGN1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WytzCn+2fQKRA9pD4pfNjViCZ+KNFc0cWLJKGODOYHE=;
 b=JnDiNPNdTCavQMPpbJdcZSayjv5SS8SvnrMgvCg1aPblwuCeQctI5sllpf9eJZ1Lu/hBBIcyDgRVrP1vkatFtGLimDx8gjILVaef8j/C0Da06+kXW50j5ZuoTrHDOv9WQCb0MFyPjAuwtRhpp2GaCfXV/LVLazWN3fGaNin9COU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB3731.jpnprd01.prod.outlook.com (2603:1096:604:5b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Sun, 12 Dec
 2021 14:08:05 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4778.017; Sun, 12 Dec 2021
 14:08:04 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/4] watchdog: rzg2l_wdt: Add set_timeout callback
Thread-Topic: [PATCH 3/4] watchdog: rzg2l_wdt: Add set_timeout callback
Thread-Index: AQHX7tXCtObr+SypAE6bexCLaMrdiqwt0U6AgAANvQCAAQAbkA==
Date:   Sun, 12 Dec 2021 14:08:04 +0000
Message-ID: <OS0PR01MB59226629B87A5726D7CF87A986739@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211211212617.19639-1-biju.das.jz@bp.renesas.com>
 <20211211212617.19639-3-biju.das.jz@bp.renesas.com>
 <4d5f3e8d-ff4d-27a1-d0b5-55be69d025c2@roeck-us.net>
 <4ab667fa-2d89-53c8-edd8-a0b5e4305e80@roeck-us.net>
In-Reply-To: <4ab667fa-2d89-53c8-edd8-a0b5e4305e80@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7606ea9a-0d8b-4697-70a2-08d9bd78d101
x-ms-traffictypediagnostic: OSAPR01MB3731:EE_
x-microsoft-antispam-prvs: <OSAPR01MB37315BDD1785054A98FC012D86739@OSAPR01MB3731.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wObH2Y/T6Q5qtXiDELZEO7+brfQY57QITc9uBRskWy9pDM9xCsJSA6N8PUhC3aSR/VLj1Sbbcb1C5/y42asi+jQ1jbyCHCLaLUGydrcrJCcpl+LkY7htez6f7J3gsQTTZQuDo9Q6wPXfKkh7KkbislMKmGaeC9nq9ukf3LiLv9u84/XPTFH8Ztww0J/z2Ckl2z4rQ3VWM/PlXJB4bjZXYWKmRSka+JXAZ/wNEygxP6KhckH3E8Zx8y64iBlFGUYn9uan5A6EQZNk/U2ETZJcjd+XBWzcQo5lasJGsOrMQNNh/iUq2U4HmcM2hCxDgcuFMJJ/iAdeZ84EiTKFtxNUJEji6MsRYBDONILmASzrVLNgW+zzfISVmnD0F1CkzAQoyv8NotixUM/mB4S/N4D5lDE0hMIMoCCMdpAglONkVevW5jjDp26go9F5p3xDsMA2cALnmiwoV17mMei0xDfwvDhXWlWXVKcD3zz33LIWTYx5Q9LAQxrMSu4kFOMn6JMvEvHx4VMJeVjxQcCXVlSh+vZoiKkh8bnZj21hY5ocEEoZOXkgYmzcUyqVyV9afrlkGSQ5F5FVwpsQkcg26aoodKMEJu3brrBbZ/j1vEaifTwEH0dFo0kebd85e7djbBNyPxg1Wu1m1ox5VrSrRrMcqTL/LbbQ+Ji7X4KbBkEye87sCaQc0KDkC1CvCyqcwPPP/pRKeX0ltG4x/EBo8sbpow==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(38070700005)(316002)(9686003)(110136005)(8936002)(55016003)(86362001)(8676002)(54906003)(66556008)(66476007)(38100700002)(53546011)(76116006)(66446008)(186003)(5660300002)(52536014)(508600001)(7696005)(4326008)(33656002)(71200400001)(64756008)(6506007)(26005)(66946007)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zm5KY3p6NkxxSGhKTENwWXQ1NDZEanZwZXh1MVlsSzRtdExXaGFGYkErUEJJ?=
 =?utf-8?B?K1Nkd3M4eXI3U0taU3FSVWNGR2c0ckhFbDR3ei9UeXFBUVhIc0tnd1c4TFA5?=
 =?utf-8?B?S3REMkZSdWpkV1ZRbjlvV1d2SDZnYzJrV3Nmc0c3bGdrTFo5M1k1eHRDbFhV?=
 =?utf-8?B?Z2RoMkJFZ3Rzdm9JajZPbnViR2xpVFo0VnNiRzV4cFp3WTVNK0RWNDZNRjBQ?=
 =?utf-8?B?RGE0NDFiL1MxOE9jWWUxVFU3aEpxUnl5SHJ3K1VvQnBTNTdLZTNKU0h2MktE?=
 =?utf-8?B?M3NPTTBZMGhsVHJ5UjNFN3Ixa2Y3M2Q2SUgrZEphbkNKMndObUQxL1VUbVVk?=
 =?utf-8?B?TEROYmNTQjB0b0k5NUZ2clQ2cFlRbi9qc3JLa0l0YnZlcXJvRzJQdmQ1K2NW?=
 =?utf-8?B?K25qR1ZTbzRQYmJEWHo5QWRvazQ2L2NYeXQvYTVKbXB0RlpNa3RXUlRXbU1y?=
 =?utf-8?B?dzVWSnZJVVk0bWJ2dFF6NmtZbXdjL2ppR0pyT3ZRQzd1aXYwSk45Y3ZrcUgy?=
 =?utf-8?B?eWlmYitEUXpzSDNKNEcwVWYydHNPY3ZuWVgrV1NvbHd4Q1hleElRdlRLYVZ1?=
 =?utf-8?B?M29QOERVYWVMT1V1K1R3WEJhRElFempmbDNGbDRHclVERVpYTmY3NDNGNmR4?=
 =?utf-8?B?OEFTTEtGOGhoWWZ5NG5vRW1GbmJuUE1YWWFmTTRURFJWTW55aThFQTVrbmxM?=
 =?utf-8?B?WWR1TFQzMU5PY2h1WDdqSWx4ZExkWStWcDkwQTk2WHR5YXdYL3ZqNVFJamM2?=
 =?utf-8?B?S2loOWNJdEpveThDb09BUlFPWksxOGRkYWtkbGxDNm04VkxQTEV3UHlyRzZB?=
 =?utf-8?B?ZEI4ekExL3dGU1d4NmtwM0tvNWk2dnBYRlUxeHoxWTVkR3g1TFl3U0J6bk4x?=
 =?utf-8?B?dTBEN1FhdElsa0tVQWZpZzRDS215dTlFNUQwa1o4WFM5cGdBTUFhVGJ0eHdi?=
 =?utf-8?B?QzBNMytpQUpjbXhjMWl1Z1lnUUNMMVpwRUxEazFQbUxVeUMzNDhRVHVWYWE3?=
 =?utf-8?B?Vnl0dFlDYWFSaGRCRGVSYWZObkFzMkNsRE56SXVqZ3ljMStOL1hpLzJndjRW?=
 =?utf-8?B?MHIzTGJqU3J5RWRubFh4bjBWNzRKTHNLc3QvOXN2U3FrOW5sNHpFVEJtMWVJ?=
 =?utf-8?B?eERPdCtvN3hTdjloN0pLWndXVDQ0WllPbWxxamR3ek1YbW1CR1FiNUdpOVp3?=
 =?utf-8?B?NkFsSlRZcEE2VHU2UWg5L3ptWk1xVkdVbzhsTnNlV2pKR3kxRWRBalFpcDF2?=
 =?utf-8?B?Y3ZDS3kxWEM1MDg1M3dJY1A4THlDKzdZSHJhZjE1bzVvS3FnbUtFNm9YVGhI?=
 =?utf-8?B?WHlNaTgyY2lNYWw0Sjc5aXlIdVcyY3JQZ1FpaWJrTjQ0V3dnL3VHOUIwdVhD?=
 =?utf-8?B?RFA4dHJmN01wN3EySHIvb2MySXZid1ErS1dHZ2tYc1A2b2V6cWEwLzg2NElp?=
 =?utf-8?B?N2M0aHA3WTNBRktMUXRiRXd4R2QrblVMU3Yyb1d5V3pULzlWaHRDM0JFcGZy?=
 =?utf-8?B?aVpBTHhtdWxvZjYrVU4xMlBycVpMTkNvZjZsMlJBRDNGeUxEbEtPM3JscjhK?=
 =?utf-8?B?QlRSa1FIc1pjdWpkdWJQbTlZU0JpVmdoMGJTbkl3ak85ZHdCbzk1VTc2VlJR?=
 =?utf-8?B?WkxBRFN6MEc0MTRKaWxCZGRxL1YvdlZoRE1rU1pnT2dyYS9sQ2s5NEV6NkF6?=
 =?utf-8?B?TDk5czAyOWtER3hIZ2FFNFVEUUpzVFZrQW9RMGRzc3FMdkFKSS9FY1VPNXlh?=
 =?utf-8?B?RzVnWTd4MGlkUTI2Vi9SeFVuOENmYTZXR1NXeTlUTTVnSFBXdDhMZ3RGVWFO?=
 =?utf-8?B?eDA1OWs0VDFMRzB1bTFQRnh1WkxQYWs0RklVQUVxenM3T1hyZk51UnlqVzcv?=
 =?utf-8?B?bkcwY2dhUkFkc21Zd0hFRndXWExEVjhNbmZnK1YvRVdYZjRhcSs3VUhlOHNP?=
 =?utf-8?B?OTE4N0ZPQ3gyUlBVUEN2ZWpld1JwMUIvdTRRdktUSEwySUxaRjR0YXBVdVho?=
 =?utf-8?B?TWNUR0N3MHdRU0Jnc0tuRVBzLzV6Q1Y1N3o4NGsrdXpNUWVoclJhZ1lkUW05?=
 =?utf-8?B?UncxY09LKzUrcFlyS1NYRzloaG5ycEY5SjJpRXZLcWlwN1ZGUWd0M2ZDaGlh?=
 =?utf-8?B?cURDWXdxdDVmc3dyTkw5Q1hkblErdHVrR1BKU01VaGdkT3VQaHp1RWhKSmxl?=
 =?utf-8?B?WHNRV3pLRnBzbTZNSGF4RytkMjEzYmF2ODh0dVBvUjAwSUUxdVRHMitJUHYy?=
 =?utf-8?B?RnBsNUFGck5WZXExeUgyUDl1eFlBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7606ea9a-0d8b-4697-70a2-08d9bd78d101
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2021 14:08:04.4885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U0BifNF6lUdqqmtAz1cbUVvW4E4B4I/n/dCjKnBpukfYCs8WxDWHdtXfmORMyXyUYbN70tlTzUL8CxiAn22FArl27Qcexjz6xX3SIEk5MqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3731
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR3VlbnRlciBSb2VjaywNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvNF0gd2F0Y2hkb2c6
IHJ6ZzJsX3dkdDogQWRkIHNldF90aW1lb3V0IGNhbGxiYWNrDQo+IA0KPiBPbiAxMi8xMS8yMSAx
OjM4IFBNLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiA+IE9uIDEyLzExLzIxIDE6MjYgUE0sIEJp
anUgRGFzIHdyb3RlOg0KPiA+PiBBZGQgc3VwcG9ydCBmb3Igc2V0X3RpbWVvdXQoKSBjYWxsYmFj
ay4NCj4gPj4NCj4gPiBUaGlzIG5lZWRzIGFuIGV4cGxhbmF0aW9uLiBXRElPRl9TRVRUSU1FT1VU
IGlzLCBhZnRlciBhbGwsIGFscmVhZHkNCj4gPiBzdXBwb3J0ZWQuIEkgY2FuIHNlZSB0aGF0ICdj
b3VudCcgaXMgbm90IHJlY2FsY3VsYXRlZCwgc28gdGhhdCBpcyBvbmUNCj4gPiBvZiB0aGUgcmVh
c29ucy4gSG93ZXZlciwgaXQgYWxzbyBuZWVkcyB0byBiZSBleHBsYWluZWQgd2h5IGl0IGlzDQo+
ID4gbmVjZXNzYXJ5IHRvIHN0b3AgYW5kIHJlc3RhcnQgdGhlIHdhdGNoZG9nLg0KDQpXaWxsIGFk
ZCBleHBsYW5hdGlvbiBpbiBuZXh0IHJldmlzaW9uLiBCYXNpY2FsbHkgb25jZSB3YXRjaGRvZyBp
cyBzdGFydGVkLA0KV0RUIGN5Y2xlIHNldHRpbmcgcmVnaXN0ZXIoV0RUU0VUKSBjYW5ub3QgYmUg
Y2hhbmdlZC4gSG93ZXZlciB3ZSBjYW4gc3RvcCBXRFQgYnkNCmlzc3VpbmcgYSByZXNldCBhbmQg
dGhlbiByZWNvbmZpZ3VyZSB0aGUgbmV3IHZhbHVlIGZvciBXRFNFVC4gU28gbW9kdWxlIHJlc2V0
IGlzIG5lZWRlZCBoZXJlLg0KDQpBcyB5b3Ugc3RhdGVkIGJlbG93LCByZXN0YXJ0aW5nIHdhdGNo
ZG9nIHVuY29uZGl0aW9uYWxseSBpcyBub3QgY29ycmVjdC4NCk1heSBiZSBhZnRlciBtb2R1bGUg
cmVzZXQsIGlmIHdhdGNoZG9nIHRpbWVyIGlzIGFjdGl2ZSh0ZXN0X2JpdChXRE9HX0FDVElWRSkp
LCB0aGVuIA0Kd2lsbCBjYWxsIHN0YXJ0IGZ1bmN0aW9uLiBJZiBpdCBpcyBpbiBzdG9wcGVkIHN0
YXRlLCB3aGVuIGl0IGNhbGxzIHN0YXJ0IG5leHQgdGltZSwgDQppdCB3aWxsIHBpY2sgbmV3IHZh
bHVlcy4gU28gYm90aCBjb25kaXRpb25zIGFyZSB0YWtlbiBjYXJlIGhlcmUuDQoNCj4gPg0KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
ID4+IC0tLQ0KPiA+PiDCoCBkcml2ZXJzL3dhdGNoZG9nL3J6ZzJsX3dkdC5jIHwgMTAgKysrKysr
KysrKw0KPiA+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPiA+Pg0KPiA+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9yemcybF93ZHQuYw0KPiA+PiBiL2RyaXZl
cnMvd2F0Y2hkb2cvcnpnMmxfd2R0LmMgaW5kZXggNThmZTRlZmQ5YTg5Li5jODFiOWRkMDVlNjMN
Cj4gPj4gMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvcnpnMmxfd2R0LmMNCj4g
Pj4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9yemcybF93ZHQuYw0KPiA+PiBAQCAtMTE3LDYgKzEx
NywxNSBAQCBzdGF0aWMgaW50IHJ6ZzJsX3dkdF9zdG9wKHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UN
Cj4gPj4gKndkZXYpDQo+ID4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+ID4+IMKgIH0NCj4gPj4g
K3N0YXRpYyBpbnQgcnpnMmxfd2R0X3NldF90aW1lb3V0KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2Ug
KndkZXYsDQo+ID4+ICt1bnNpZ25lZCBpbnQgdGltZW91dCkgew0KPiA+PiArwqDCoMKgIHdkZXYt
PnRpbWVvdXQgPSB0aW1lb3V0Ow0KPiA+PiArwqDCoMKgIHJ6ZzJsX3dkdF9zdG9wKHdkZXYpOw0K
PiA+PiArwqDCoMKgIHJ6ZzJsX3dkdF9zdGFydCh3ZGV2KTsNCj4gPg0KPiA+IElzIGl0IG5lY2Vz
c2FyeSB0byBzdG9wIGFuZCByZXN0YXJ0IHRoZSB0aW1lb3V0LCBvciB3b3VsZCBpdCBiZQ0KPiA+
IHN1ZmZpY2llbnQgdG8gY2FsbCByemFfd2R0X2NhbGNfdGltZW91dCgpID8gSWYgaXQgaXMgbmVj
ZXNzYXJ5LCBwbGVhc2UNCj4gPiBhZGQgYSBjb21tZW50DQoNCk9LLCB3aWxsIGRvLg0KDQpCYXNp
Y2FsbHkgd2UgbmVlZCB0byBkbyBhIG1vZHVsZSByZXNldC4gVGhlbiBvbmx5IHdlIGNhbiBjaGFu
Z2UgdGhlIFdEVFNFVCByZWdpc3Rlci4NCk9uIHRoZSBuZXh0IHZlcnNpb24sIGluc3RlYWQgb2Yg
c3RvcC9zdGFydCwgd2lsbCBpc3N1ZSBhIG1vZHVsZSByZXNldCwgYW5kDQpJZiB3ZHQgaXMgYWN0
aXZlIHRoZW4gd2lsbCBjYWxsIHN0YXJ0Lg0KDQo+IA0KPiBUaGF0IHNob3VsZCBoYXZlIGJlZW4g
cnpnMmxfd2R0X2luaXRfdGltZW91dCgpLiBBbHNvLCBhcyBtZW50aW9uZWQgaW4gdGhlDQo+IHNl
Y29uZCBwYXRjaCBvZiB0aGUgc2VyaWVzLCB0aGUgcmV0dXJuIHZhbHVlIG9mIHJ6ZzJsX3dkdF9z
dGFydCgpIG5lZWRzIHRvDQo+IGJlIGNoZWNrZWQgaWYgdGhlIHdhdGNoZG9nIG5lZWRzIHRvIGJl
IHN0b3BwZWQgYW5kIHJlc3RhcnRlZC4NCg0KT24gdGhlIHNlY29uZCBwYXRjaCwgSSB3aWxsIGFk
ZCB0aGUgY2hhbmdlcyBhcyB5b3Ugc3VnZ2VzdGVkIGZvciByemcybF93ZHRfaW5pdF90aW1lb3V0
KCkuDQphbmQgcnpnMmxfd2R0X3N0YXJ0IHdpbGwgY2hlY2sgcmV0dXJuIHZhbHVlIG9mIHJ6ZzJs
X3dkdF9pbml0X3RpbWVvdXQuDQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4gDQo+IFRoYW5rcywNCj4g
R3VlbnRlcg0KPiANCj4gPiBkZXNjcmliaW5nIHRoZSByZWFzb24uDQo+ID4NCj4gPiBFaXRoZXIg
Y2FzZSwgY2FsbGluZyByemcybF93ZHRfc3RhcnQoKSB1bmNvbmRpdGlvbmFsbHkgaXMgd3JvbmcN
Cj4gPiBiZWNhdXNlIHRoZSB3YXRjaGRvZyBtaWdodCBiZSBzdG9wcGVkLg0KPiA+DQo+ID4gR3Vl
bnRlcg0KPiA+DQo+ID4+ICsNCj4gPj4gK8KgwqDCoCByZXR1cm4gMDsNCj4gPj4gK30NCj4gPj4g
Kw0KPiA+PiDCoCBzdGF0aWMgaW50IHJ6ZzJsX3dkdF9yZXN0YXJ0KHN0cnVjdCB3YXRjaGRvZ19k
ZXZpY2UgKndkZXYsDQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1
bnNpZ25lZCBsb25nIGFjdGlvbiwgdm9pZCAqZGF0YSkNCj4gPj4gwqAgew0KPiA+PiBAQCAtMTYw
LDYgKzE2OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgd2F0Y2hkb2dfb3BzIHJ6ZzJsX3dkdF9v
cHMgPQ0KPiA+PiB7DQo+ID4+IMKgwqDCoMKgwqAgLnN0YXJ0ID0gcnpnMmxfd2R0X3N0YXJ0LA0K
PiA+PiDCoMKgwqDCoMKgIC5zdG9wID0gcnpnMmxfd2R0X3N0b3AsDQo+ID4+IMKgwqDCoMKgwqAg
LnBpbmcgPSByemcybF93ZHRfcGluZywNCj4gPj4gK8KgwqDCoCAuc2V0X3RpbWVvdXQgPSByemcy
bF93ZHRfc2V0X3RpbWVvdXQsDQo+ID4+IMKgwqDCoMKgwqAgLnJlc3RhcnQgPSByemcybF93ZHRf
cmVzdGFydCwNCj4gPj4gwqAgfTsNCj4gPj4NCj4gPg0KDQo=
