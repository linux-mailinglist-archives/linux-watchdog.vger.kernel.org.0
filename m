Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60284471BE4
	for <lists+linux-watchdog@lfdr.de>; Sun, 12 Dec 2021 18:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhLLRc3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 12 Dec 2021 12:32:29 -0500
Received: from mail-os0jpn01on2137.outbound.protection.outlook.com ([40.107.113.137]:25663
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229584AbhLLRc3 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 12 Dec 2021 12:32:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELomyJDs+zkjaE1FyL9/p9UScQ3VekeH8MPwOvmVZWbYk9jNy61lUkSRxQ5yB3kNRf76UFT+SClbJcLUw8a5E9cbCP8X/D4Lt5QQlJS8Tjv/wWcRXzOQTWSGzIfctmerOGJt6iZTRKN2jROyLWZe+ni4brV4taaGC0Oz4He4cw9qzjaxZEj8EeUzPrR6Q/HcDbbpzaq0PtmRX7jCvgNNU9JKmuqiyLz6NC5NvvwKsBSBDy3roXl5MfNNcd2vusf0JKKMry+i0INrPbH1Dc7U7HcMjAmanPLPfcS2+zs/ETHfrL+R7eOrlkeTEtWYfXix/yfUiPC54mu/Ume2rPZ8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NApmwOcmudKsyvmAoHJNiIpyiuDi+lKtsR2+Dp6/zg=;
 b=aYKaVLGG9iFyv577WbCE0ngozhoFjhwDZD7F/4oLfgqlrgpjRUdDmqFwegABDI1XDhPc+S85G2TvBq/mo7sr8EWR9wVjYL3rTA7jhhsv1MIMEHWkjudJx9LoBodQOgybgvtxeOF0MIg/SLDaINm7nA3HWcMGWukr7k8hwTHFZsbEO5weftOrLXN2eGvX4gwcLPc1PqNjJmF+yIB/WitQoUA5up4jCBBtusTlPSzQFLGy5SCMVVLZI82gwI7GKWKWWOmCR2geqsOKHo53fQc9TZoWp6gkbN3pVNQHakVFLm7/ioufc2t7eTmqBOF60Kr+V2h3ix8BT1mgmVMcOJwd2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NApmwOcmudKsyvmAoHJNiIpyiuDi+lKtsR2+Dp6/zg=;
 b=WZrCfNQY0jnWnuegTGUUO/hhzZDD3fm+S+fQHsnXgfP/LyW061HzXmCKrRLert7g30c86cGUMBN8EYXVkEjYlwaLYEjIRc3Db1rIcSZveFlsOniotAwewDGxvAL5yfbEJ9eVzxk9Ooh57SQBrkuZSMRBUCIsxVxKpJq7DmDoDPU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4181.jpnprd01.prod.outlook.com (2603:1096:604:4d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Sun, 12 Dec
 2021 17:32:24 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4778.017; Sun, 12 Dec 2021
 17:32:24 +0000
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
Subject: RE: [PATCH 2/4] watchdog: rzg2l_wdt: Add error check for
 reset_control_{deassert/reset}
Thread-Topic: [PATCH 2/4] watchdog: rzg2l_wdt: Add error check for
 reset_control_{deassert/reset}
Thread-Index: AQHX7tXC7YvsvGpzZE2T8W5/9tdsYKwt3naAgAE4djA=
Date:   Sun, 12 Dec 2021 17:32:24 +0000
Message-ID: <OS0PR01MB59229710B933C59A8B646B6086739@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211211212617.19639-1-biju.das.jz@bp.renesas.com>
 <20211211212617.19639-2-biju.das.jz@bp.renesas.com>
 <960186bd-8ac8-42d8-edba-90c81eadfac1@roeck-us.net>
In-Reply-To: <960186bd-8ac8-42d8-edba-90c81eadfac1@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ec4ddec-6f22-46b8-f9c7-08d9bd955c56
x-ms-traffictypediagnostic: OSBPR01MB4181:EE_
x-microsoft-antispam-prvs: <OSBPR01MB4181A78298CDA8AEFCA3D1DC86739@OSBPR01MB4181.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l0UYtK4doR643vhIoxCqUCb7fn3Y9nMVJVnwap1hmkRTtAxqlLy6QFNBQMXBo13eiCspM2wgMBKU/STNceNFYON6o7PRGum5gQrDi3a2tRPsDR9ZnxocmZONFJdE1Ga5Xrg8jg82yBbgLQs90zOW3vKgoOmW1noDbhNj3MFY0pHk9bjz1pTKwjBxcpbLxUpm8Sbv52eEyMVHi2avBVQF2hVcioGF3xMcK5UtRRHdPBcbrHC/C2zgkAJpBvglcOl6x8q4rXijb/1CfJaUP6so23qHzZExgQHqIOtm4YG9vhNzx41A9bQ34Wq/vQPEsIYgodqZhskhi34PtQfawuWEv226/WtrbOqjgpgjt7AZ4RcgH7cULXQKZSqxo6429H7TsECHwegLCXhQIA4uQ3JdhbIPTWf6kbYBxYTHpPcutiGIrnAcEzQKJACjxozsmCcOxYdjRysZc4/zr3BUhQAe2uMRRlfVAwF/QjMAvmtx9zok3vzILqamwRsggpGfayTtsy/4YIznFZcJRoRXtuoq6yYvVo5gwVYToBEOWBrJZoKVL4UcWSy4eu24REmBR4BxDNZG5M31Z+mY97NaDzN2AdmasI0n34phXwz7dc2Srb9+SetQbbqJQs6keVilT0UFeja3Cl2Eq9DoZFVcfZJ1Hm36garr+DZXYci+O6PAK0M3EMr+Se2SVx/wnq0lItWjse6/l0+NNr6esp4zkJifDUhIVsTAUULLiUMur+S3Rp3DlypcbSHIkVTczkKe2vDMTaaNZvY4lQv9qu8hnHYfw7RcQ73Lr8bV37NS6Hv3Fx4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(53546011)(6506007)(9686003)(52536014)(26005)(8936002)(86362001)(8676002)(186003)(508600001)(966005)(33656002)(110136005)(2906002)(71200400001)(316002)(4326008)(38070700005)(122000001)(76116006)(38100700002)(66476007)(5660300002)(83380400001)(66946007)(66446008)(64756008)(66556008)(55016003)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K20zSTVvQXJxRUZadDRtQkYzUlhVdWlkdWhUWUJ4MTIxWEdsbGp1Tkt4OUh4?=
 =?utf-8?B?NXVabmNaZTZHYy9OY1hrQTUrSVYxK0ZKNVlLc1NGa0xwTEhQYWpGc2Z3SHc4?=
 =?utf-8?B?YmsreDFvc3p0V1Z5Rkg1bTBKVFZiRml2MHlYQ29uYUVBZklRaGRkNWhsNjdJ?=
 =?utf-8?B?blB6YlU5eTJlNmYvUlpjM09zUGd5NGc4ZGYzMW94UVpaTmFWaE5UM0Y0SDhH?=
 =?utf-8?B?WHk4MHcvd2FQWVFRNVlMcmhsa1NFL0NJQSs5NTVqWEpPVmJva2xMQ29IVG9w?=
 =?utf-8?B?L3ZnL2ZFejA2ZlhmYys5TnUwUWZkZnJCRFgwMTVZSEpXd0hHeVhvV0NnTkEy?=
 =?utf-8?B?UXNTcVdseG5QUGdWRUR0dEk4V09PbnRsclhqblArQjFtdXM1NVRWTHBUZ0pP?=
 =?utf-8?B?a3ZCbDltcFZKTHFTOXRhejNjakVXV08wdSt5LytubWFCWEIrTzdJS3JwdURY?=
 =?utf-8?B?N0E5QzVETjA0UUF2cnNNTU5TaU1FdVFvMGs5UkJjbUUya21sdVBUZ2ViR3l6?=
 =?utf-8?B?ZjNOWTNDMmlqdFlsWFlvTFNrNWE4U29ZTlI2QWpWQ3JOREdpaEdjNEZNS0FP?=
 =?utf-8?B?QU1YY0hsS055dmtKOU5TWnNQd29RVkVlSjlOK256QzM3RWhWVkE5RFBzcTFh?=
 =?utf-8?B?ZTJOb09OdHUzWjd3VVVoYmVveG9CYUQ4MDA4clIzMk8rcXBBbXRJaFZ2OEt6?=
 =?utf-8?B?Y0tmNFdRTU45RjRWZWJPaUNaRXFsS0Y2M1hyRlhJOFBDRGJrYzlodFpZTEJ5?=
 =?utf-8?B?di93ckNCMEhZVXVvMW9ZejlZTXRxMk4vTXNybnY2b1pVd1NDMENaa29rN3Ju?=
 =?utf-8?B?S3prSGowQ2p0YjZ6ZmpWRUJxcXgvUWVWK3hMTEdSSU5lZVdYTVNicmxWemU4?=
 =?utf-8?B?Sk9sdUQwb1pNNWlyMnFrK0t0S0FuOTZISWViNmh3ZldteUVIclc0NUt5V25s?=
 =?utf-8?B?YXFBRklDVWpxd1lIaXV6WitZaS9qaGdHY2xQaWVCUElqQTN1WkJPODBZRkdH?=
 =?utf-8?B?REJubHlNY1hTY1lFdTB4Y3FzWGlVMHplWGNRR0FiZXJ6QWhRaEZPVDdJYTJW?=
 =?utf-8?B?OUpEZ1NLbGF0NHFrVkxLSDk1SHFOa1F2a29aSEVXVzlic3Z3a0gwMW4wbE1G?=
 =?utf-8?B?ZWd2eVU4aXpqYUpFcEo1aU9oN3o4WDNVTk1SSkNJTDhpc3lTOWo4Qkc0L3Jy?=
 =?utf-8?B?L1JRSWlmZDRiemN1YjhqcTlBWFJ1VkcvdzZKRU1GcHhrQVkzNURkS3BQbXRl?=
 =?utf-8?B?Skk5c0h4ZzkrNlN0RXdyQkNvTTRoSThtWGVPVG1lZDdvSG1PTGtid21sSjR3?=
 =?utf-8?B?cHBXMWRHcE9rMVZacDFSYW1ZVnhLR1FaRTcwVUFPUmk1QzNidmoxMUVpSUJt?=
 =?utf-8?B?RVBtQkRyUDltOXZZZGFRSEp1S3dsSTFFUElKbzZjMFdqVExBSWxhWW1RTHNq?=
 =?utf-8?B?MW9yOG4wcVlzZXB4dUNlZnhPUk56NHRTOXhjdjd1U3IyZkt2U2hMQzBUcUlO?=
 =?utf-8?B?QVU4NDAzME5Rc2N5cllVRm1icTkwSCt4YzlqOTdNZkZZeWJUWG5BVTVKTWo0?=
 =?utf-8?B?SnNtMzRkZzZhbTF5b0YvUExJMWg2TTF6NGpwSjFVbmgvQU5CdXhOQ0ZwMmJk?=
 =?utf-8?B?VnliSDV5OUIwMURsTDRjMzNvaEE0YWtzTXVpS1BtNFdiSTEvTVBYQ09vUFR6?=
 =?utf-8?B?bVpwaEpRVzI1V1JETjRvQ0FQblZkYUo5cTM0SUZjOXZhM29FZE1HOHR4RVI4?=
 =?utf-8?B?dlphekVWT2E4UVRESjBNQjFUVjFIM0toZTZKanltSk9kLzRPdzZvZlBiNG5p?=
 =?utf-8?B?NStpVlBGenpoTFVzOVJTSUpRY3RSeTlFN29yQU05L0o3NC8yQjBXRVQ1UVdv?=
 =?utf-8?B?TVd5MlRQemY3a2lmRTBUTFpPb0RRMExhRVQzbkIwcTBLMEF3QkpIWXV4WkRv?=
 =?utf-8?B?eldJNWVDc2IrT1JsMlhEaGg5MmIyTXdqVkFybGxCTDJmWUk4c2Zub09VdUFu?=
 =?utf-8?B?U3liU2d2em1mNlVtd2hyblJwZ2J5Zkcyb3N3WVZTeWUrZDk4Ykd6bHJob3NF?=
 =?utf-8?B?NGhBMnlHUmMxa2RMc0Znb09tNFl6RSs4REQ3b09PUzd6K1hwVTZaa3Q5MWdv?=
 =?utf-8?B?UjV1dk1vTXQ0MzBXWEFRbGVVNDgzS2ZuZmxuU1VILzU3N3NTR0RIa0QvdDEr?=
 =?utf-8?B?R3pYUzVScHFVdmI4VTdnOFJCWUVpUmswMEI1UVg2LzJNaUdVYmJjWFFPYWs3?=
 =?utf-8?B?Qzd1QllXWWkvNEt5MEdtdUtrUUxBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec4ddec-6f22-46b8-f9c7-08d9bd955c56
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2021 17:32:24.2564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7gmjs3u+/2nG+M/YNtTMDTQ0K2uQXmKAvLCqICgW2jIViWpreBZhkaTVwL9cerfMmuSakdFcVD3xRgJehfUOoXhsDXE9cxFSVmEkBuoRojQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4181
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR3VlbnRlciBSb2VjaywNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvNF0gd2F0Y2hkb2c6
IHJ6ZzJsX3dkdDogQWRkIGVycm9yIGNoZWNrIGZvcg0KPiByZXNldF9jb250cm9sX3tkZWFzc2Vy
dC9yZXNldH0NCj4gDQo+IE9uIDEyLzExLzIxIDE6MjYgUE0sIEJpanUgRGFzIHdyb3RlOg0KPiA+
IElmIHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoKS9yZXNldF9jb250cm9sX3Jlc2V0KCkgZmFpbHMs
IHRoZW4gd2Ugd29uJ3QNCj4gPiBiZSBhYmxlIHRvIGFjY2VzcyB0aGUgZGV2aWNlIHJlZ2lzdGVy
cy4gVGhlcmVmb3JlIGNoZWNrIHRoZSByZXR1cm4NCj4gPiBjb2RlIG9mIHJlc2V0X2NvbnRyb2xf
ZGVhc3NlcnQoKS9yZXNldF9jb250cm9sX3Jlc2V0KCkgYW5kIHJldHVybiB0aGUNCj4gPiBlcnJv
ciBjb2RlIHRvIGNhbGxlciBpbiBjYXNlIG9mIGVycm9yLg0KPiA+DQo+ID4gV2hpbGUgYXQgaXQg
cmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgZnJvbQ0K
PiA+IHByb2JlKCksIGFzIGl0IHR1cm5zIG9uIHRoZSBjbG9ja3MuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBSZXZp
ZXdlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pg0KPiANCj4gU2VlIG5v
dGUgYmVsb3csIHRob3VnaC4NCj4gDQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL3dhdGNoZG9nL3J6
ZzJsX3dkdC5jIHwgMzcgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tDQo+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9yemcybF93ZHQuYw0KPiA+IGIvZHJp
dmVycy93YXRjaGRvZy9yemcybF93ZHQuYyBpbmRleCA5NmYyYTAxOGFiNjIuLjU4ZmU0ZWZkOWE4
OSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL3J6ZzJsX3dkdC5jDQo+ID4gKysr
IGIvZHJpdmVycy93YXRjaGRvZy9yemcybF93ZHQuYw0KPiA+IEBAIC04NSw4ICs4NSwxNCBAQCBz
dGF0aWMgdm9pZCByemcybF93ZHRfaW5pdF90aW1lb3V0KHN0cnVjdA0KPiB3YXRjaGRvZ19kZXZp
Y2UgKndkZXYpDQo+ID4gICBzdGF0aWMgaW50IHJ6ZzJsX3dkdF9zdGFydChzdHJ1Y3Qgd2F0Y2hk
b2dfZGV2aWNlICp3ZGV2KQ0KPiA+ICAgew0KPiA+ICAgCXN0cnVjdCByemcybF93ZHRfcHJpdiAq
cHJpdiA9IHdhdGNoZG9nX2dldF9kcnZkYXRhKHdkZXYpOw0KPiA+ICsJaW50IHJldDsNCj4gPiAr
DQo+ID4gKwlyZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0KHByaXYtPnJzdGMpOw0KPiA+ICsJ
aWYgKHJldCkgew0KPiA+ICsJCWRldl9lcnIod2Rldi0+cGFyZW50LCAiZmFpbGVkIHRvIGRlYXNz
ZXJ0Iik7DQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArCX0NCj4gPg0KPiBUaGlzIHBhdGNoIGlu
dHJvZHVjZXMgYW4gZXJyb3IgcmV0dXJuIGludG8gcnpnMmxfd2R0X3N0YXJ0KCkuDQo+IElmIGl0
IGlzIGluZGVlZCBuZWNlc3NhcnkgdG8gY2FsbCB0aGlzIGZ1bmN0aW9uIHdoZW4gc2V0dGluZyB0
aGUgdGltZW91dCwNCj4gdGhlIGVycm9yIHJldHVybiBuZWVkcyB0byBiZSBjaGVja2VkIHRoZXJl
Lg0KDQpHb29kIHBvaW50LiBBZnRlciByZWNoZWNraW5nLCB0aGlzIGNhbGwgaXMgbm90IGF0IGFs
bCBuZWVkZWQuIA0KDQpGb3IgV0RUIHN0b3AvIHNldHRpbWUgd2UgbmVlZCB0byByZXNldCB0aGUg
bW9kdWxlLiBTbyB3ZSBzaG91bGQgdXNlIHJlc2V0X2NvbnRyb2xfcmVzZXQoKSBpbnN0ZWFkLg0K
RnJvbSBwbGF0Zm9ybSBwb2ludCwgaXQganVzdCBhc3NlcnRzIGFuZCB0aGVuIGRlLWFzc2VydCB0
aGUgbW9kdWxlWzFdLg0KDQpXaWxsIGFkZCBjaGVja3MgZm9yIHRoaXMgY2FsbCBpbiBzdG9wL3Nl
dHRpbWUgYW5kIHJldHVybiBlcnJvciBjb2RlIHRvIGNhbGxlci4NCg0KSSB3aWxsIHNlbmQgVjIg
d2l0aCBjaGFuZ2VzLg0KDQpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9jbGsvcmVuZXNhcy9y
emcybC1jcGcuYz9oPXY1LjE2LXJjNCNuNjg1DQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4gDQo+IEd1
ZW50ZXINCj4gDQo+ID4gLQlyZXNldF9jb250cm9sX2RlYXNzZXJ0KHByaXYtPnJzdGMpOw0KPiA+
ICAgCXBtX3J1bnRpbWVfZ2V0X3N5bmMod2Rldi0+cGFyZW50KTsNCj4gPg0KPiA+ICAgCS8qIElu
aXRpYWxpemUgdGltZSBvdXQgKi8NCj4gPiBAQCAtMTE1LDkgKzEyMSwxNSBAQCBzdGF0aWMgaW50
IHJ6ZzJsX3dkdF9yZXN0YXJ0KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UNCj4gKndkZXYsDQo+ID4g
ICAJCQkgICAgIHVuc2lnbmVkIGxvbmcgYWN0aW9uLCB2b2lkICpkYXRhKQ0KPiA+ICAgew0KPiA+
ICAgCXN0cnVjdCByemcybF93ZHRfcHJpdiAqcHJpdiA9IHdhdGNoZG9nX2dldF9kcnZkYXRhKHdk
ZXYpOw0KPiA+ICsJaW50IHJldDsNCj4gPg0KPiA+ICAgCS8qIFJlc2V0IHRoZSBtb2R1bGUgYmVm
b3JlIHdlIG1vZGlmeSBhbnkgcmVnaXN0ZXIgKi8NCj4gPiAtCXJlc2V0X2NvbnRyb2xfcmVzZXQo
cHJpdi0+cnN0Yyk7DQo+ID4gKwlyZXQgPSByZXNldF9jb250cm9sX3Jlc2V0KHByaXYtPnJzdGMp
Ow0KPiA+ICsJaWYgKHJldCkgew0KPiA+ICsJCWRldl9lcnIod2Rldi0+cGFyZW50LCAiZmFpbGVk
IHRvIHJlc2V0Iik7DQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArCX0NCj4gPiArDQo+ID4gICAJ
cG1fcnVudGltZV9nZXRfc3luYyh3ZGV2LT5wYXJlbnQpOw0KPiA+DQo+ID4gICAJLyogc21hbGxl
c3QgY291bnRlciB2YWx1ZSB0byByZWJvb3Qgc29vbiAqLyBAQCAtMTUxLDEyICsxNjMsMTEgQEAN
Cj4gPiBzdGF0aWMgY29uc3Qgc3RydWN0IHdhdGNoZG9nX29wcyByemcybF93ZHRfb3BzID0gew0K
PiA+ICAgCS5yZXN0YXJ0ID0gcnpnMmxfd2R0X3Jlc3RhcnQsDQo+ID4gICB9Ow0KPiA+DQo+ID4g
LXN0YXRpYyB2b2lkIHJ6ZzJsX3dkdF9yZXNldF9hc3NlcnRfcG1fZGlzYWJsZV9wdXQodm9pZCAq
ZGF0YSkNCj4gPiArc3RhdGljIHZvaWQgcnpnMmxfd2R0X3Jlc2V0X2Fzc2VydF9wbV9kaXNhYmxl
KHZvaWQgKmRhdGEpDQo+ID4gICB7DQo+ID4gICAJc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2Rl
diA9IGRhdGE7DQo+ID4gICAJc3RydWN0IHJ6ZzJsX3dkdF9wcml2ICpwcml2ID0gd2F0Y2hkb2df
Z2V0X2RydmRhdGEod2Rldik7DQo+ID4NCj4gPiAtCXBtX3J1bnRpbWVfcHV0KHdkZXYtPnBhcmVu
dCk7DQo+ID4gICAJcG1fcnVudGltZV9kaXNhYmxlKHdkZXYtPnBhcmVudCk7DQo+ID4gICAJcmVz
ZXRfY29udHJvbF9hc3NlcnQocHJpdi0+cnN0Yyk7DQo+ID4gICB9DQo+ID4gQEAgLTIwNCwxMyAr
MjE1LDExIEBAIHN0YXRpYyBpbnQgcnpnMmxfd2R0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UNCj4gKnBkZXYpDQo+ID4gICAJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIFBU
Ul9FUlIocHJpdi0+cnN0YyksDQo+ID4gICAJCQkJICAgICAiZmFpbGVkIHRvIGdldCBjcGcgcmVz
ZXQiKTsNCj4gPg0KPiA+IC0JcmVzZXRfY29udHJvbF9kZWFzc2VydChwcml2LT5yc3RjKTsNCj4g
PiArCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocHJpdi0+cnN0Yyk7DQo+ID4gKwlpZiAo
cmV0KQ0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIGRl
YXNzZXJ0Iik7DQo+ID4gKw0KPiA+ICAgCXBtX3J1bnRpbWVfZW5hYmxlKCZwZGV2LT5kZXYpOw0K
PiA+IC0JcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgmcGRldi0+ZGV2KTsNCj4gPiAt
CWlmIChyZXQgPCAwKSB7DQo+ID4gLQkJZGV2X2VycihkZXYsICJwbV9ydW50aW1lX3Jlc3VtZV9h
bmRfZ2V0IGZhaWxlZCByZXQ9JXBlIiwNCj4gRVJSX1BUUihyZXQpKTsNCj4gPiAtCQlnb3RvIG91
dF9wbV9nZXQ7DQo+ID4gLQl9DQo+ID4NCj4gPiAgIAlwcml2LT53ZGV2LmluZm8gPSAmcnpnMmxf
d2R0X2lkZW50Ow0KPiA+ICAgCXByaXYtPndkZXYub3BzID0gJnJ6ZzJsX3dkdF9vcHM7DQo+ID4g
QEAgLTIyMiw3ICsyMzEsNyBAQCBzdGF0aWMgaW50IHJ6ZzJsX3dkdF9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlDQo+ID4gKnBkZXYpDQo+ID4NCj4gPiAgIAl3YXRjaGRvZ19zZXRfZHJ2ZGF0
YSgmcHJpdi0+d2RldiwgcHJpdik7DQo+ID4gICAJcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jl
c2V0KCZwZGV2LT5kZXYsDQo+ID4gLQkJCQkgICAgICAgcnpnMmxfd2R0X3Jlc2V0X2Fzc2VydF9w
bV9kaXNhYmxlX3B1dCwNCj4gPiArCQkJCSAgICAgICByemcybF93ZHRfcmVzZXRfYXNzZXJ0X3Bt
X2Rpc2FibGUsDQo+ID4gICAJCQkJICAgICAgICZwcml2LT53ZGV2KTsNCj4gPiAgIAlpZiAocmV0
IDwgMCkNCj4gPiAgIAkJcmV0dXJuIHJldDsNCj4gPiBAQCAtMjM1LDEyICsyNDQsNiBAQCBzdGF0
aWMgaW50IHJ6ZzJsX3dkdF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0K
PiA+ICAgCQlkZXZfd2FybihkZXYsICJTcGVjaWZpZWQgdGltZW91dCBpbnZhbGlkLCB1c2luZyBk
ZWZhdWx0Iik7DQo+ID4NCj4gPiAgIAlyZXR1cm4gZGV2bV93YXRjaGRvZ19yZWdpc3Rlcl9kZXZp
Y2UoJnBkZXYtPmRldiwgJnByaXYtPndkZXYpOw0KPiA+IC0NCj4gPiAtb3V0X3BtX2dldDoNCj4g
PiAtCXBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOw0KPiA+IC0JcmVzZXRfY29udHJvbF9hc3NlcnQo
cHJpdi0+cnN0Yyk7DQo+ID4gLQ0KPiA+IC0JcmV0dXJuIHJldDsNCj4gPiAgIH0NCj4gPg0KPiA+
ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcnpnMmxfd2R0X2lkc1tdID0gew0K
PiA+DQoNCg==
