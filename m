Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A433054687F
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Jun 2022 16:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238485AbiFJOio (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Jun 2022 10:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349610AbiFJOiU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Jun 2022 10:38:20 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2092.outbound.protection.outlook.com [40.107.113.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07FCA126983;
        Fri, 10 Jun 2022 07:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlF0rBllAr0+Jrbrjeni8e6FFqj2icE82curDz5X/b0QoUV1RTxiu9TWXlmi7TDZU5b5XKVyn3ZYYWSdgfQztXUeUP7G0FEzrVhwaJyf4gittN/W2NN7BMycqE/oFhQRIYFaDgXvnakt5/8p5lG7b2ky8wjjjQLl0zwulsxLrgD6xAfMMUX1a7YytkJ9fkFFyGoBjdNBZFLlc3NZlQ8R2dbNUMJlP9RECLgaX7RCNza5zvddLdMykD9J2WcQ4+Idj2doS/SKz+SNcILp9FxRB0dDFs1jFoxWJPHeTOjtoh1x9oQ7PzufrxBv3zAM9sb/gxK0wAPY4Bv1cBpYNitQCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TfJ6maVtxh/VXfE+T3fueBaAdgP1dCSuwAHx8BMenE=;
 b=TZlPEpxaIn+dZdJQv7mylL+wg/e+lYNoFFZBDAzuE99nlR5w9Bjq3WAcSP9vWi5hC8k30bv3Ag3kqaoMskPBjS/uugOFx/EXQ96DlFjJaT+yFyywwaPe7UZdEQDuEcrGFSE0aE3Ea3zOWIEFbkUlF3IjjBmRQgrrvTFohuHzNK0xf6geDlgmYfgQVtILemYNQvb40mpXLvEi1sMK/kjAFwApRP+zswYNzIwFHrpz0PWeBY9YxmWpjR0+JNx/ve6xjaTBSdhvYjbPAOC0iVEdVE2h1zZaUPX3brM1ufMtuJMV6O6xTu+ikq6hmY6eDhBf6bbRilhJfveU9wyk2daUUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TfJ6maVtxh/VXfE+T3fueBaAdgP1dCSuwAHx8BMenE=;
 b=lhgk8aRCnoGdJG/8UkZxtAo6MpfiFfWAqoxxk/1rq4O4pfEqVleSMrXZUQjm6kBk/AxoqdyhIyaDyCM+qxrSgPzWz1j+Ub9TJJHdjlWq+ns0fElRiO+rgex46RBSjFkEe2WcGAVmVorWIXebhLAgrjGYKLOjWXEkk4mRuUsdOio=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYAPR01MB6201.jpnprd01.prod.outlook.com (2603:1096:400:85::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 14:38:14 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%6]) with mapi id 15.20.5332.015; Fri, 10 Jun 2022
 14:38:14 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH 1/2] dt-bindings: watchdog: renesas,wdt: Add r9a09g011
 (RZ/V2M) support
Thread-Topic: [PATCH 1/2] dt-bindings: watchdog: renesas,wdt: Add r9a09g011
 (RZ/V2M) support
Thread-Index: AQHYenZtlRgjZcOPoEW6UK7rCK4W+a1FVr2AgANeLUA=
Date:   Fri, 10 Jun 2022 14:38:14 +0000
Message-ID: <TYYPR01MB7086EFE64F1DF8C6141E8719F5A69@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220607135619.174110-1-phil.edworthy@renesas.com>
 <20220607135619.174110-2-phil.edworthy@renesas.com>
 <83a8fb86-3311-87fe-c4ca-ab8e6d0cf784@linaro.org>
In-Reply-To: <83a8fb86-3311-87fe-c4ca-ab8e6d0cf784@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee08e89e-5aad-4465-06df-08da4aeeda0b
x-ms-traffictypediagnostic: TYAPR01MB6201:EE_
x-microsoft-antispam-prvs: <TYAPR01MB620185DF26AC308B628FD7D8F5A69@TYAPR01MB6201.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WrUspEGJmfeLQmgohJ+5LBmzgnt04Dr/+Eao3h+P+iXheYJOhnsll7RFrHHBouqyned1BlEY6dPe/mfq37C7UwCI9Hz8N31L8tWV2bMFMwFIMylXP3iQXhar0gM3nXKabUxGNCYnGI6Zzq7StOnD+7rrCeWum6sAB7ebErtYW4NCtJiccnoP/5NHzb2ho7ay8vHIgy1+3J59TmMk4w9p+Br3/7/GwDdxV//wBZN7siiheHIkM0ltK1Mw2V/wNAKKDhvtDFHtt5sdpY/sI3JUkcZWPhQL2JjCZfRTbelmjDmDBVgXrqDwJDffGjjWyyNeEctDWtM8Mgr7bqJq36iMHdzBY+yrOx0YGcySyMJAe0HDvC3fdJUIpPeDBgWpmgLdCceuPg/sW7J/hVbBPJoDDxcYn8D9fYZEF6VoklK5L4CWktF6oWZY/q3tLDuLktljBsjXj7/BNnURfWr+Ste7BapOpLmHZLDQnDKjfYMXfrgNLyZv/jXEse2XXJ4ySaGWEgAe7p5oJJT8IbaDtsTHvTqpPfBkTHWHk+eA/HHgkicVZi8RLMPeUWOb3hf+JNF4vw7QDhwJtCbuEmkOexTZUJprphtIopniC8UT3gb7kKS9S62gl2+6oILSGc/De4yCM3wK6U6s46aqnmebiIzOTUE5fWzBJw4ZjMKbs95M1yaJ7/5SrnwdA8tTItDS+sGj/Q8Yc9J4mi5BvUJByqxryw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(8676002)(71200400001)(26005)(2906002)(7416002)(5660300002)(508600001)(33656002)(38100700002)(44832011)(9686003)(6506007)(7696005)(86362001)(53546011)(64756008)(38070700005)(83380400001)(66446008)(186003)(52536014)(66476007)(8936002)(316002)(66946007)(107886003)(76116006)(54906003)(66556008)(110136005)(55016003)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dForMzJsMXF6SVcwZXZnUVhzTW5kMitScVhKZElLTTNudEkrSkZZazJQbUpW?=
 =?utf-8?B?NFhEL3RRTWsrUFBleDZ0dkZpcWNzZ0NLQ3Blc1pNY3hLYUw0c0NNdUYrNGll?=
 =?utf-8?B?Q05OdTk2ZXNoenZMUlNNekN1UThwK0RrWWd6bXB0a0c3UHpnRWcyV3FaS0h4?=
 =?utf-8?B?R2dvb1UxaWxvdHBIQUdHdE9RL1lZQWUyNEwyczlnQUZYV2FML3dTOXd1SzB1?=
 =?utf-8?B?WGpVa1laWkJNU1JRQThzaXBxZS85TjFWWWpJQ05hVGtPeFBBUmhUNmlhd2wz?=
 =?utf-8?B?c1ZjMHRJM2FEaExMTHZEWitKSlNsZVRDSXhMbHp1Y3pvV0FUdVJ5cWZhVEF4?=
 =?utf-8?B?MVZKU1FlV3N1bmRQSENXWC9LQWVzYVdIbnNqTmtOVFU4aDhLWG5KS3lTV0JG?=
 =?utf-8?B?Umh4MzJuelc3OHpmWlExUTF6dFZIUWw0TDhzc2c0TjUrVXRZbG1LbTNJb2pi?=
 =?utf-8?B?OU54WEtwVTFHUko5alk1RFhyQlhKY3hrR3FYYko1K3FNS2RJWVNMZjljaFQ2?=
 =?utf-8?B?RGJ4amxsUTRtM1B2QXBTMXdpLzlQeDVzaW5kdGNrYUxOWEo3anpZaWtLdWxV?=
 =?utf-8?B?M1pnZEhJTVczUmZWODBPTDFOaEI0SEcxRk9vSEQxVDUwWXY2VGhUYzVydUFi?=
 =?utf-8?B?am5Ya0gvcmJqbHZPSnRFbjBua3hLUDUvVU84RjI2SXh3VkRJMGcwNy9nUUJX?=
 =?utf-8?B?dS9QbGYxWTUxekdDVnZDa2kxa0tLeSt3OVZKUkl4c1lLSU96RmJrd1pnRjJZ?=
 =?utf-8?B?NGlrQzVZcGJuMFNicTZDVHNXNlZGclJCZnRFNXAwQ2QreTdrNGd1a1FHeG83?=
 =?utf-8?B?Zk9TSDE3dlBKTE1sbmF3OUk0Z2VDTGx2T2dNRythSkp1SXA1T25meWZMeFdL?=
 =?utf-8?B?WkhSVkZZMnRDbTVzTWlhUjNkeTNQMHE0YWtiS3R1M3VqUFg3OTBQN2YzOFlH?=
 =?utf-8?B?Y0hSd2c3MnJnVC9jNEYvMnUzVlBzWHlCMzZNemtyc1M5Rzl3a3p3b0RUczhq?=
 =?utf-8?B?dDZOVExlNjBWd2s3OTB5c0dvK2RoanFaNHF2QllpT2RPWDJZVVhkSGdXNkxQ?=
 =?utf-8?B?RnRyT2xQUXFkRWYwb2dxdkJ1aTFrLzQrOVA2R0VQZEw1WmFhZGdzVmFXTXN1?=
 =?utf-8?B?VnVrU2U4SjMyNzI0MllkNGIzYks3c1l3dDBjbEhKMWhabk9vRm54MXV6UFRY?=
 =?utf-8?B?NEpLdmNHdXpyT2xVamZJNjI5VnJZbktVUTMyRE0yUzh0MW5CeGVzU0x2RUkw?=
 =?utf-8?B?bUErQW1ZWGZPVC93a25ESkFPbmd1ckNzak9RR09LKytMVTNEMCtzZmY2UXNK?=
 =?utf-8?B?ekRBQllqMUQrYWkrY21rbWZ5Y2FpZ0hsS3VqV3pCaUpCOXBSZ0RLSmxJTTNa?=
 =?utf-8?B?TDJHTnBIRHB0V1hSUXBKdWE2d0UzNmZ6bjN0VzVRWERyS09PWWp3aGw3RlB5?=
 =?utf-8?B?VE04RmFBRVFESlpKa2o1dXhReGYrbkVzWXZ6ZVJjYzFYaitna21BZ1JoKzhm?=
 =?utf-8?B?a2lWeVdSRWFseHhxOVBJc3ZTUUJORXdDQVhFNUNwUDZpV3VhcWdQaWdwR09D?=
 =?utf-8?B?cnFiT2VBbkN4T3RMSlYyanp6VTZVTkd2d25oaG0wNEVVU05VbjRBL2kvbE9y?=
 =?utf-8?B?L2ZmdURzWTJobUcybVpKYkNxaHFrcjdaQnNHd1lxY0FXN3A3LzdROUZmRnJo?=
 =?utf-8?B?TW8zUlBxUWJBOUVZUk5WY0pCU1VTV2gxQWxEMmlscElRN0xITkU4eTFkN29m?=
 =?utf-8?B?YTRIQ0hjV0tUbEFiL2F2VnBtVEFqYXNPME5QSEhIYUtjNHprcnJYM2dPVU93?=
 =?utf-8?B?ODNiTnFqZVpPWlE1L3NObU0xSCtWSyttTFVJSEtqeEpyZTVZOXUzeFlOQlR6?=
 =?utf-8?B?SlhSczdSQzNLVVNQMnB4UUNsK3pNVEx4dU91ZnpWRnlnOFdGMEZ0WS9xQkdD?=
 =?utf-8?B?SWlCWjc3STR5UzQwTVZFNGZ3MElpdndadDI3R05FQTlCQVh5dE92cXN1REFz?=
 =?utf-8?B?T3gwRE1QYTlZRzlwRXJ6NW02aVVEdDM1SnVpZy8xWlkzdVVIQWs4amFOTS82?=
 =?utf-8?B?TnlpdUFVdWMwcWpsMnJWTEVZcHZEdldQRzlocnF4dGx6MlhDOFBTVTc2akJ6?=
 =?utf-8?B?ZDlRSnI4Y1hqSmR6Z3lKS3h0dC9iM3c4Zks2S2tWQTZyZmgxa2M2ZjVFb1Vu?=
 =?utf-8?B?NHVybEphY25LamI4OFFPbEt3N1gzY3ZScVFldk5hNWdCdkJHNHR4dVFFdjNz?=
 =?utf-8?B?NVd5cEJWUTJPQmhxckFuc1c0dWpodkFIMHArT0JkNjdrbmhwdmoyMWpySng2?=
 =?utf-8?B?a1pSM1NJVVJSa2gzanFUN3ZhSGI0K2UxMXFtOU5HRFpscU1sclBHRnJQQkNs?=
 =?utf-8?Q?WUOVXE2hBqBzR+5Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee08e89e-5aad-4465-06df-08da4aeeda0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 14:38:14.6705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UsNvW1N1jOpTweFpgzfUOGwFq/OFWn4g6+B8H41KWRAf+IFt12oxgHq2Y6950vLgKximttw4t9bk9AkZtP4Xdh/KX/SPopMvCyFVtVDX3nA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6201
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQpPbiAwOCBKdW5lIDIw
MjIgMTE6NTIgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMDcvMDYvMjAyMiAxNTo1
NiwgUGhpbCBFZHdvcnRoeSB3cm90ZToNCj4gPiBBZGQgdGhlIGRvY3VtZW50YXRpb24gZm9yIHRo
ZSByOWEwOWcwMTEgU29DLCBidXQgaW4gZG9pbmcgc28gYWxzbw0KPiA+IHJlb3JnYW5pc2UgdGhl
IGRvYyB0byBtYWtlIGl0IGVhc2llciB0byByZWFkLg0KPiA+IEFkZGl0aW9uYWxseSwgbWFrZSB0
aGUgYmluZGluZyByZXF1aXJlIGFuIGludGVycnVwdCB0byBiZSBzcGVjaWZpZWQuDQo+ID4gV2hp
bHN0IHRoZSBkcml2ZXIgZG9lcyBub3QgbmVlZCBhbiBpbnRlcnJ1cHQsIGFsbCBvZiB0aGUgU29D
cyB0aGF0IHVzZQ0KPiA+IHRoaXMgYmluZGluZyBhY3R1YWxseSBwcm92aWRlIG9uZS4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFBoaWwgRWR3b3J0aHkgPHBoaWwuZWR3b3J0aHlAcmVuZXNhcy5j
b20+DQo+ID4gUmV2aWV3ZWQtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL3dhdGNoZG9nL3JlbmVzYXMsd2R0LnlhbWwg
ICAgICAgIHwgNjMgKysrKysrKysrKysrLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDIg
aW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL3JlbmVzYXMsd2R0LnlhbWwN
Cj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvcmVuZXNhcyx3
ZHQueWFtbA0KPiA+IGluZGV4IGE4ZDdkZGU1MjcxYi4uNjQ3MzczNDkyMWUzIDEwMDY0NA0KPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9yZW5lc2Fz
LHdkdC55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dh
dGNoZG9nL3JlbmVzYXMsd2R0LnlhbWwNCj4gPiBAQCAtMzEsNiArMzEsMTEgQEAgcHJvcGVydGll
czoNCj4gPiAgICAgICAgICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDU0LXdkdCAgICAjIFJaL1Yy
TA0KPiA+ICAgICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxyemcybC13ZHQNCj4gPg0KPiA+ICsg
ICAgICAtIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgLSBlbnVtOg0KPiA+ICsgICAgICAgICAgICAg
IC0gcmVuZXNhcyxyOWEwOWcwMTEtd2R0ICAgICMgUlovVjJNDQo+ID4gKyAgICAgICAgICAtIGNv
bnN0OiByZW5lc2FzLHJ6djJtLXdkdCAgICAgIyBSWi9WMk0NCj4gPiArDQo+ID4gICAgICAgIC0g
aXRlbXM6DQo+ID4gICAgICAgICAgICAtIGVudW06DQo+ID4gICAgICAgICAgICAgICAgLSByZW5l
c2FzLHI4YTc3NDItd2R0ICAgICAgIyBSWi9HMUgNCj4gPiBAQCAtNzAsMTMgKzc1LDI3IEBAIHBy
b3BlcnRpZXM6DQo+ID4gICAgcmVnOg0KPiA+ICAgICAgbWF4SXRlbXM6IDENCj4gPg0KPiA+IC0g
IGludGVycnVwdHM6IHRydWUNCj4gPiArICBpbnRlcnJ1cHRzOg0KPiA+ICsgICAgbWluSXRlbXM6
IDENCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBUaW1lb3V0DQo+
ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IFBhcml0eSBlcnJvcg0KPiA+DQo+ID4gLSAgaW50ZXJy
dXB0LW5hbWVzOiB0cnVlDQo+ID4gKyAgaW50ZXJydXB0LW5hbWVzOg0KPiANCj4gVGhpcyBhbHNv
IG5lZWRzIG1pbkl0ZW1zDQpJIGxlZnQgbWluSXRlbXMgb2ZmIGZvciBpbnRlcnJ1cHQtbmFtZXMg
YW5kIGNsb2NrLW5hbWVzIG9uIHRoZSBiYXNpcyB0aGF0DQp0aGV5IGFyZSBvbmx5IG5lZWRlZCBp
ZiB5b3UgaGF2ZSBtb3JlIHRoYW4gb25lIGludGVycnVwdCBvciBjbG9jay4NCg0KQWZ0ZXIgYWRk
aW5nIHRoZSBsaW5lcyB5b3Ugc3VnZ2VzdGVkIChtaW5JdGVtczogMSksIEkgZmluZCB0aGF0DQon
bWFrZSBkdGJzX2NoZWNrJyBwYXNzZXMgZXZlbiBpZiB0aGVyZSBhcmUgbm8gaW50ZXJydXB0LW5h
bWVzIG9yDQpjbG9jay1uYW1lcyBzcGVjaWZpZWQuIElzIHRoaXMgZXhwZWN0ZWQ/DQoNCm1pbkl0
ZW1zOiAwIG1ha2VzIG1vcmUgc2Vuc2UgdG8gbWUsIGJ1dCBpdCBpcyByZXF1aXJlZCB0byBiZSBn
cmVhdGVyIHRoYW4NCm9yIGVxdWFsIDENCg0KVGhhbmtzDQpQaGlsDQo=
