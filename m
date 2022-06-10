Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22334545CB4
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Jun 2022 08:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241047AbiFJGzs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Jun 2022 02:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238834AbiFJGzr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Jun 2022 02:55:47 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2092.outbound.protection.outlook.com [40.107.114.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F7A4F1C3;
        Thu,  9 Jun 2022 23:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Scti910axR4jLcU1uWmRG4j1SZWpeOuE3JS/rEP0thc/fEszUdh0RxxeyR3pNu8yd7h9EsH2bav+qNDZLAC/oc9gyzCtva41oZsLbX3DN/8Ay74ISF6HjLUwEJpV4su+18mgatzHmZYLmoMmVZaBOPYixx310+s4g/brG7TD+g2WcPCcAeuNOlq4YLBp8hDcL4+CBwS8bUYbUlaGFMPTMLSMbOWm/xPMhfsRLrH2KmEhgOj+fOXqSBiUNccfsjlBi5GQg8jlkzg0RqhOn6u4wVXVY7kdcIle1dht+RvU/psiG/gO9uiLGSjYr9GnNTJum1sXchMPtd3xGQF5Vv8hYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTkPBTsYz1v+nZ0MZMGzW3zUsxw97i8quigffXCIcwc=;
 b=U9imgtm5vSFb1RwIJy6a+GAz7Cr+/l8+sFQ93nIy5iOJCQpLlDhcBuCJazPvs6o8v4fZKQgV5PHUYj+QN5WW+GW7yjOR1zueANWCyJmLes61zTjjTMSOUBVzEY5It3WfYc3w8t6Z9Ngp47SRW0+IOyE3DzW5C8G89nCEXdgl6EjH3rfu7qPrzoBHOHgtXwkApyk/Vwso57IU1ICNO1KdD1/euPENPUEbDWnYvitNgE7bkOEyODqdNFXzTyI/9SLzZd7/Y8rH0J+614Sh+UbUOhhqdfUWidhVY72oFkTjZsvqXWbFkEBO+WmAFwk4g/AgloDKLh8rgyfhiCMtha1LZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTkPBTsYz1v+nZ0MZMGzW3zUsxw97i8quigffXCIcwc=;
 b=iOLdvz9RXt40QS6QPMIeGGoXgArddsootykDGsCKYA6PMvSxi41OUGu7mqCLcM6heiV9Oxl0zUYUQYFs7jNfgADkvwR6nlsTCS1Go5zHGGRVcOJDEhF6CCz7Y/mEGc88DzbMA4ZUk2Y1wkdD1qPfuVEMCpzVv1LeAYi9lOfNoMQ=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OS3PR01MB8383.jpnprd01.prod.outlook.com (2603:1096:604:192::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 06:55:43 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%6]) with mapi id 15.20.5332.014; Fri, 10 Jun 2022
 06:55:42 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH 2/2] watchdog: rzg2l_wdt: Add rzv2m compatible string
Thread-Topic: [PATCH 2/2] watchdog: rzg2l_wdt: Add rzv2m compatible string
Thread-Index: AQHYenZ0I4s+kmHxx0uYMwyW2mjA061G3Z2AgAFbTgA=
Date:   Fri, 10 Jun 2022 06:55:42 +0000
Message-ID: <TYYPR01MB7086D11FB042D1F763C21F1DF5A69@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220607135619.174110-1-phil.edworthy@renesas.com>
 <20220607135619.174110-3-phil.edworthy@renesas.com>
 <CAMuHMdVyeB+2Sx072igo1uFmAgYoJWABSX2Ks851=tzNUrKzEw@mail.gmail.com>
In-Reply-To: <CAMuHMdVyeB+2Sx072igo1uFmAgYoJWABSX2Ks851=tzNUrKzEw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59103c6d-ccf3-4d6c-2723-08da4aae3c3d
x-ms-traffictypediagnostic: OS3PR01MB8383:EE_
x-microsoft-antispam-prvs: <OS3PR01MB8383AD9735D89A789E2AAAB4F5A69@OS3PR01MB8383.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xx4VdG4GsXSs2xKhW6Sicy8XAu62LdvDxPyuyz7FWpHdqHAt6sby61eFVw+z2Ai3+QzcHtos+oEQCaFwrWyp2JFMBIF3HQN0CaUlFYXf2y3p6dZzVR42wYt5qGuK5BG+3JE7bvPlu83sD9EqbpoXA5Tx7PUkjRhFYXXQdY39t3R9va2GZgavjsh+/LNuSwXQNrgGz+LsuJ/6RDStfy00IrUKMqSctXFdSpijN9jMygIu5fJMeYphxUazxxUyukdfhnCWrkEMmmh+wDVE5OOjkr/k4OmMtkeusw0/5jl08DZ8QSORyN61BTousBpFvMYEikWje2jdjrGmmfEhICLtV5/gvWQQRuYiYj/s/GgkiNLcRIYbLGRGffXXQzAqO+NwOl0ZAp3IlfTqDehONUHftkHCZSbVN+ccF3Rg8GLQbcisSbCAem55BPfXckquGfMsFsYGb3a3nF5XEEx+6bjVYfxSFFWmBET5d3eOFyv5Z7gpIVX6uw4TyECJOZvHVaxNBF5hdNSdFnHLQsQRYG012VZGyxsEZbzaodxzLPxYEhvBjTvqU6qSO7L5+R8Y7tbUNHFjhqi/GBhzecz2WjCJZqlW1+OovvZeO1LuBDFIky4JmRFVK+0PJICiqUD2Lb+GqP8AM3kpcQNyWxRfJVBlqRkmz9VMqmEIeD2ZTnIrvROfrI1R6eTm0CV/tA0hgN0JKL4G77u7RGPCxjY2gv5Fgg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(55236004)(7696005)(53546011)(6506007)(26005)(9686003)(52536014)(44832011)(5660300002)(4744005)(33656002)(8936002)(2906002)(508600001)(4326008)(8676002)(76116006)(86362001)(71200400001)(38070700005)(38100700002)(107886003)(6916009)(66446008)(64756008)(66946007)(66476007)(66556008)(54906003)(186003)(316002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TktpNG5qUlBOdHc1NGlHWCs3SEdWS3JJbGIxeU9jVEFCQU1YcnphaWJUZnNp?=
 =?utf-8?B?bEljK1oxN1NJYzZwTzRlMm9uallsM3p4OThHaHJTMWFRU1NESHJzSzJPZ3lh?=
 =?utf-8?B?TlIvbUdXZk90NU1jZ2FjanRWWUJvMnFwaVJmNzdjNm5ZMTRDSWk2OGRGbXpU?=
 =?utf-8?B?N2NtcnNYNERIUFhYV1J1cmgwZHljTFR3SHlTNlVtZzVvdkJXZU5EdDF2VEU0?=
 =?utf-8?B?VFQwZEpVVWF6NzRmbUpMdE0xWlZVRGcxT1UyczRkOHdNZ2NoVEdVM3h1dGdT?=
 =?utf-8?B?eFA3WktBcy9RRmlwZU13TXU2Tzc1NlduS2I2V1h3NmpuaC83dk5oVHQxSkVn?=
 =?utf-8?B?ditOVG5RZUVsVFRNTU1yd09aMHhBR05RRW5IL2pJZElLOHlYSHllQW5tbElw?=
 =?utf-8?B?OFhYcFh1b0x1NTNPNWFDRzhUTkhOQlNSNWVGLzBNc3IwVHZjOE9FUnZGV0ty?=
 =?utf-8?B?aCtyMTQ5YmlTR216dzVoSmtQWXNBUDF6ck5GQXVMejBxQlpIWCtQSko3TUV2?=
 =?utf-8?B?Tmw3bUJuWjNGdHRaV3RiR2U4RWFEQVpVQTZ5NURReGgzWitXL1FoeHEzM2xX?=
 =?utf-8?B?TjFEYWxzZDgxbHdqMnlqT2ozNXRFVTJXRWFDNEVGVHh6Znp3emFRVmx0a1Yv?=
 =?utf-8?B?cmMyL0tjajh5YWR6VFEyMVJ6OEZiTGIvY1c3dTljOEZ5VlZ1c2NwOW56YWhP?=
 =?utf-8?B?emNPcEhpMVdBUEFucU9jQ2JEaENGK3BKVGw2NVI3eExjKy9VRWFZN2g5TkRP?=
 =?utf-8?B?ZU1qblRhdUJLS29FYXFCWFc0eEprQzFMTkkxNnJ4cUdYS041Z3JaYnZ1RC9L?=
 =?utf-8?B?d0Q3RE5HSDVXSWxqQUVWdlk0K2hoRkFiU1MyYklsSWIvTXNWV3NYcmtBZlJx?=
 =?utf-8?B?SWdkYVV0UnR6ZUhQR3JHcHdGL3JBd0VCODY0RmFpWWV5MzBnT1dCWGlHREJS?=
 =?utf-8?B?VGcwYWhVYXY5SlZ1SUpNQWNlcUh3c210akNPTW9BRG1sZDN6UmhCUTYreUJZ?=
 =?utf-8?B?UlMrWE14RGVBbEtNUGcwTFAyU1k3b0ZvQW1vOEFJZ3Y2djNtdTAxWE1XamdZ?=
 =?utf-8?B?eThUTjdoWGVxMGlyR29hNktrc2VDamR6SUtxT1c1MThuS1FJK3NTV0NMbVdT?=
 =?utf-8?B?RWFhbm9TLzd6Skh0YnBDTlQwa3ZJdjVTSFBUWEFqTnpkVy8wUXhxQkhac08x?=
 =?utf-8?B?MzViZll6S1NoMU5tZHVBK1dXUmxDOU5TOVZSS1gxVjIyNlBvVnJURmc4VFAr?=
 =?utf-8?B?RmU3bUJIb0E2ZThFaG1iVVQxN0FqcFhwbVM5b0ZETzhramhSSi9rWmRGWWRS?=
 =?utf-8?B?YS80ekd2MjJlRkFUYnpUOXZ4cExHMnJYWHBZNG5QNnE1YkllOGRHUUp0cDJh?=
 =?utf-8?B?dWdVV0pRRWpCTkJ2UGVRazlnOUpQbm9jVmMzdWcrNS8zTDFjUXNPRHE1a0tU?=
 =?utf-8?B?aVBHYXdjNjMxUHVQekJZajdLRHBtdGkrb09BanpmckZvdGpvdWFaLzRRSEJi?=
 =?utf-8?B?VjZKVzR4RVd2eVFvT21IUThWc28xNGxIaGpHaExOZlhPdGlPQTZ4c3dTcmZP?=
 =?utf-8?B?ODNTVE4zTk1lNUdWQXZyWTJoeWc1aXVPNk1YcWI2LzN4WFlnSVdma1lTamdC?=
 =?utf-8?B?QzZhc2YzZ2tMeGcxZlJldGRISXozMTJLNjNHYm5EdDNrUS9zWGF6MEoxRzNu?=
 =?utf-8?B?cjdoRDZLcU9ydWc0UjFYa0ZrT2R6Wm1VOGRrdWcvbkM5Zi9DQ3ZpQ3AxZ2dS?=
 =?utf-8?B?bS94bGJzaDJUS0txMCtpL0k1aGhaWnpueG9oS1lEbVd4SW9SZmtyYzFrd3kz?=
 =?utf-8?B?ckRMTFNaZTJsUngyY0tPNXNZcVRCVnZpMVBxYmhOZlJaaDEwWDI5RzBua3pB?=
 =?utf-8?B?WHMvbkJVcEsyTGVjR0VuVXpUSEpzbnFDVWNDRHNlRjMzeXdlVWtkYXN6RUtV?=
 =?utf-8?B?YjdEMi9DWGRJSmVKamtZbDdlOFNid2tzZVU3QW9MZ1JZQ2cvamt3U3FqeWlr?=
 =?utf-8?B?a2dKQU5ZZy9acHBKeXMwY0VjTVdMdEVRN1A2dFBqNUlDME1BZkdNSTd0aXpC?=
 =?utf-8?B?cnlXNnllcVNlRWhEcmVDS2JsSFpCdjR0R2dkek9CR0M3VHhmT3pXSCtPUU5J?=
 =?utf-8?B?MzhLOVFWVjRGQ3FJLzdTSDU2V1FWY2F6MlJRby9iTGdNSzJGWmVTdlNmeVdt?=
 =?utf-8?B?S29TazBqdVo4UVRCYVJicVpuR3pZd0Z6cVcrVU9Dd2VEb1ZGdkc1YXdQS0ha?=
 =?utf-8?B?TDEzdjU2NlJmUlhkZDlQTm0wbmc3Rk9DVWZCYU85WmJoa0xQejczeHZvbXdw?=
 =?utf-8?B?UGc3bDFJUkJUS2FHL0pLUDlpcE1Od0I1cFlDOW4zSzFERnN1dHlhRXdOeG9F?=
 =?utf-8?Q?7KZpGPnpoc+U9CA0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59103c6d-ccf3-4d6c-2723-08da4aae3c3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 06:55:42.1283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Udr2zp4msigNOLxkPbyxUIHTjzNqnOeVG5RnGz/rCY5OL44zzhL67xrbdSKyV8fajgZTAHFeTCnXZWs4+wtNmHcziS4C6L1MlTpr9EjSEz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8383
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIDA5IEp1bmUgMjAyMiAxMToxMSBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IE9uIFR1ZSwgSnVuIDcsIDIwMjIgYXQgMzo1OSBQTSBQaGlsIHdyb3RlOg0KPiA+IFRo
ZSBXRFQgb24gUlovVjJNIGRldmljZXMgaXMgYmFzaWNhbGx5IHRoZSBzYW1lIGFzIFJaL0cyTCwg
d2l0aCB0aGUNCj4gPiBleGNlcHRpb24gdGhhdCB0aGUgUlovVjJNIGhhcyBhIHNpbmdsZSBjb21i
aW5lZCBpbnRlcnJ1cHQsIHdoZXJlYXMgdGhlDQo+ID4gUlovRzJMIGhhcyB0aW1lIG91dCBhbmQg
ZXJyb3IgaW50ZXJydXB0cy4NCj4gDQo+IC4uLiBhbmQgdGhhdCB0aGUgUlovVjJNIHdhdGNoZG9n
IGRvZXMgbm90IGhhdmUgdGhlIHBhcml0eSBlcnJvcg0KPiBoYW5kbGluZy4NCj4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogUGhpbCBFZHdvcnRoeSA8cGhpbC5lZHdvcnRoeUByZW5lc2FzLmNvbT4NCj4g
PiBSZXZpZXdlZC1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiAN
Cj4gPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL3J6ZzJsX3dkdC5jDQo+ID4gKysrIGIvZHJpdmVy
cy93YXRjaGRvZy9yemcybF93ZHQuYw0KPiA+IEBAIC0yNTYsNiArMjU2LDcgQEAgc3RhdGljIGlu
dCByemcybF93ZHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiAqcGRldikNCj4gPg0K
PiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCByemcybF93ZHRfaWRzW10gPSB7
DQo+ID4gICAgICAgICB7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscnpnMmwtd2R0IiwgfSwNCj4g
PiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxyenYybS13ZHQiLCB9LA0KPiANCj4g
SGVuY2UgdGhpcyBpcyBub3Qgc3VmZmljaWVudCwgYXMgeW91IG5lZWQgdG8gcHJldmVudCB3cml0
aW5nIHRvIHRoZQ0KPiBwYXJpdHkgcmVnaXN0ZXJzIG9uIFJaL1YyTS4NCg0KT29wcywgdGhhbmtz
IGZvciB0aGUgcmV2aWV3IGFuZCBub3RpY2luZyB0aGlzLg0KDQpQaGlsDQo=
