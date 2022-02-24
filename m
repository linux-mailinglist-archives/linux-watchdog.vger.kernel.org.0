Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6CD64C2890
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Feb 2022 10:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbiBXJwR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Feb 2022 04:52:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbiBXJwQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Feb 2022 04:52:16 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2104.outbound.protection.outlook.com [40.107.114.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B743CFCF;
        Thu, 24 Feb 2022 01:51:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IT93skPrq3TSEWim+EjOmxexVoQmfPEAWTF/9t1y/seZohJsraKEubwgkN3k8wx4/5Malti1ca8Kb2CUcx4plTgOnasgAmG+M1szcz6ucI97KA0bc5WP77EUMA9yfrO/RaQaYYtGIeFETb7OmodyDtmFJ+Cq0Y0z4sRe7deOSbYdtdAuyi3AC0ptEFlZ5S9zZwXI2z/r84l8WSdUEO4OoQPXVTNHqksywiKEE5gk2izgMNu5sFv5SEpC9cJbxuec9woFlr15FFmVXCcQKW9rTznbsrucJhCtN8BSmDv1gEWSwE40tpeTAc+QSAxCfVepaSjaBdurkmeEXME5ecExAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CfAUumSEVGup7qW3/BczmTxEjtj0VWo0qah6vf9ec4=;
 b=OPx+yfblfQsS9PxFqjOsKfPnMv6QaZGxC2EDXj1qEN+0gpqSB4cKWWNgiO2MkWuew8TsUuBYjpPEHc1H6NsdUFVtg3G3KnYWXIRBKvgFBNp+H/kAVndqa5zNqZ5sttC+XN1l+XXBjsmUehg/PEM0LozSOIzPGiJP6Z/HK7CVxyRBY8HnWmNQ3TtfbdJNKvvwdJWbZ7RE5LpA/djBqleo5glaaNCSTqXtMmi8v+3h+QSWNC500Ar2FQNMfPF27nA+DmmPmLeMP2dW4JwrGQ+/rGhMaCYKzk6jzlPmG8geB5iBBM5fjvzhKTZklVLcaio9+/KqCDUt50yKLxOOVACtGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CfAUumSEVGup7qW3/BczmTxEjtj0VWo0qah6vf9ec4=;
 b=rUgUneMjW8QNvhNvjtC/38uPb/zf09VYlu7B6pp8RWZzO2AjXJ/pMKRVELCiOBB98kxuOdbSGASNmdsZ4j5qxvoJfjX87dloBV27glA+BwaM/wTPnkOX8B/h7fF8O7i4nw/ewLzHlFxdw4OYaqEBzH5j9WPuzqfVCcNo7tKzxc8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4787.jpnprd01.prod.outlook.com (2603:1096:604:69::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 09:51:42 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%6]) with mapi id 15.20.5017.022; Thu, 24 Feb 2022
 09:51:42 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 5/6] watchdog: rzg2l_wdt: Use force reset for WDT reset
Thread-Topic: [PATCH v4 5/6] watchdog: rzg2l_wdt: Use force reset for WDT
 reset
Thread-Index: AQHYKM6ZUhZVyDZmwU+5Iej8/ffZ96yicr+AgAAA5WA=
Date:   Thu, 24 Feb 2022 09:51:42 +0000
Message-ID: <OS0PR01MB5922F825BB8E04A3C5F75300863D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220223160100.23543-1-biju.das.jz@bp.renesas.com>
 <20220223160100.23543-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdXnLOVSi62_kiZBr2Fze_jr2wNxLfz3ZC8SXU1ei3yecw@mail.gmail.com>
In-Reply-To: <CAMuHMdXnLOVSi62_kiZBr2Fze_jr2wNxLfz3ZC8SXU1ei3yecw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59f64139-79dc-4f3d-e382-08d9f77b4309
x-ms-traffictypediagnostic: OSAPR01MB4787:EE_
x-microsoft-antispam-prvs: <OSAPR01MB47870B643110DD8826AA60C2863D9@OSAPR01MB4787.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ch+AUMG4MVXzo31mZiN0lyw66ujmoafAr+LAMz1g96UV4xQBWNgY/u9NWCxB+rYwRjTa8w0fKOU9c41OhT9FsNrW5zctcFuJ+QEP5eGE/3V90JPr6UQJxbKFAbnQ/2WPkrWCSriGFq/incBOG4ZBpeBda7s3BeLf6P5IHT/2GgC/MVDiHlcK1/og8/4nezkPYKbEM/hLCLl2mksZgFF/6XENDFiz27B1JUnlRuYD1co5ufj5P5JIMSfXibux4M6FWkSN1aORXKn9TRFwICYYnXrw+JabyMXp/raqV613a+qo8FWsjmLJna2dL4gk8ihH5bGRAGtM7tkkas1hGOOpHEVLAtyDKldEeYrfkqS/llulKqTStHEzyA6VUfp5vdHAczbY4h1iM1MTG27poTg82aN/vLvOpFr7woynoZ9jjQmf0VsyAGw+vpIP5mzOajllb5NAc3QBxLNyn2cuoL9SpE2Z9+EE399UodEDA9fllGB9xmAeL4ypa7DBxw2P39E3Oo21aiGMauZ4bTI+ME2gruFe83kdcUNsr4tawnPKL2+OH99ZDyR77YBouS7O3K62G7G+0rgMTQ5uHOUebs2N6UfUkJQXDnIo35WuBWo3R+dI7BZXZAM4SgTcc+7Rfla+LIf/lk9BA7+56ma7i7HAskUp8f0Jh8es26RZYso0LM13vrhYm4xMcUqLtDn+RKqUW+pHVKFxHD6V5VnntwMCwQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(66446008)(64756008)(76116006)(8676002)(55016003)(86362001)(6916009)(66476007)(83380400001)(2906002)(4326008)(316002)(38100700002)(66946007)(186003)(54906003)(5660300002)(66556008)(52536014)(33656002)(71200400001)(53546011)(6506007)(7696005)(26005)(508600001)(9686003)(122000001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHpoaC9ReHFKOEpvOEJVNkh3TGV6U0pnYzNvdk9wS0NlWHpRb3JJTHIyS01a?=
 =?utf-8?B?bWdONk1TNW1oZlhGU3V4TUlFY2NIMnVraHRuK0cyNktYM2NERnk3VDZrZS84?=
 =?utf-8?B?N1UxY1ZyK2JnZmsyeEtEN1oxV2pOK21QWjlaSnNpM21jUUs3SHNIMTh3Y3ov?=
 =?utf-8?B?S0tvTkwvQzdMZG1wa2VvZWFGVi9pRGpQTmNHOEFmZWxxcW8yamhjMUNibkkw?=
 =?utf-8?B?RkczcEN2Uy9QNXJ4cnk0VVc5YXU4RXhFNDEzYzdXajRGa1JTR0dDQ0dJQlh1?=
 =?utf-8?B?WTBuYnhLaERJOW8rY2dCeExURTZaalJoOEtmamg3VDBrdWFKamY5cnQ3bGJD?=
 =?utf-8?B?OWMyRjdhLzRYKzZYbjdSQm5XMjZ4R2VRNEh3VWJTU3VQZG5WZWhaQS91RGJC?=
 =?utf-8?B?TENubEJ5NW9YK3VUZ3NScVp3dHpmbER3L1hOUWNmR3krdVh3bGExK2ZvVXZh?=
 =?utf-8?B?UXBqak8xVlErc3dUeVA5MUNsM0Mvc1hTVkR6T2VXRnIyQklORTVoTkRLSzk0?=
 =?utf-8?B?QTd3ajNtR2ZxUTNFWkNDa3cycEIyeGgrNUhzdnV3bW1PZzZNZW53WVpCa1Nv?=
 =?utf-8?B?bXZyY3RWQ21IUHJpTnhSSW5zYUh0cEF3dDFpWjdCYzQ2ejZkSEZ1cXU2UWY0?=
 =?utf-8?B?ME5oaTlVLytXZkNwM2lSTXY5R2RCRGVpR3dyQTVxZWNWUWdZaloycE90MC9u?=
 =?utf-8?B?NjB6YW9pT0RtZWxWYzVOOXZCbE41ZmdldWV4TWZCcWx6RW9QOVh6QW1JMjE5?=
 =?utf-8?B?WStlRGN5YkFQYzI2VHd5dGZVR2RESDBCc3ZXbUs2ZnE1Y3VNZ3RFbTk5dXRi?=
 =?utf-8?B?d1NPWnA5RlJESy9HYVd2WlpHL3RVU2tGaSs3cVp0UDdLT2loWlo5VzA4cWQz?=
 =?utf-8?B?SlpWZ1ZqdHZLOEl4cndqVFVlSGFxSDFmWXIvd1ZvL2N3WmNCelRRS01idGlv?=
 =?utf-8?B?eldPMXpFVUxiVWxFNlFaMkdiTjM2M1FaVGJnRjI0cUhVUGFoWmJtZnVSQkE1?=
 =?utf-8?B?Z2htUDFzc09JVFFMRWp1UE9tU1ltZkdCalJIVjRTUnpxQVdlNGIwN1JsRGNF?=
 =?utf-8?B?QjZlOVdaSHdmWktzOGRnYktMS1FudnNZUEJBM1cxNWpjbjBDNlNBbWluSks5?=
 =?utf-8?B?aUNzazAvZDZ0TEZhMjRqTXljakpXenAzRy9xRGl1M0FmOTZobWFscFRhSTZ2?=
 =?utf-8?B?Z0trNHppR2VWOGducVdNM21NWTcxbk5HY0EvMnE1K3MzVWYwMDJHV0xBYm5K?=
 =?utf-8?B?WVBkNVJ1cS9xVHpPTzZCb3NnRXZzdFE0Y0p6TFRmcEVlbHFhU2psTU9aWTBG?=
 =?utf-8?B?OWl0QWtPcmtIMUxZM0k3cEY1dm10M2VqVkEzRzBUMW9EQzF2T0VjYm83d2hN?=
 =?utf-8?B?eVJsSUhMRGxjY21aWEcrRGI0QTVJK2NQWmY2VUl3OVk5OWhpQVBuelQ4Nm44?=
 =?utf-8?B?WUlILy9TS2kxQzFyVjZncUVBWStNcWh1b0RtV243ZGRwMm95c1RZcEgwVitz?=
 =?utf-8?B?NXEyYmVTT3k1c2I3VzlxWHJhM0xwQzl3UUdQTHlsZnJOTFdBendCRTVqRUtK?=
 =?utf-8?B?TldvK2dFTkZUSEl4eHRWN2M5Y1JJaGNuZE9DL0djbU1LN2YwRnhFREljVHg5?=
 =?utf-8?B?cHJZN1Z0UUtnOHNxaUZUS3I4eTh6enZYaTQ2Vmp1MUEwN2VadGg5WUVuQXpV?=
 =?utf-8?B?Wjc2MENZNGlVUjZGQTBkYmlKcjFURE5IY244cFJUOFp5V25PL1ZtYWdYd2xH?=
 =?utf-8?B?UmNNSDBIMkZ6cEdCUkNJSWtSNEl3VmM1TXhWNU00YUhZTFR0NGtDUU1XVDZV?=
 =?utf-8?B?Q25lUDI4cE1jV1J2U3RENnhXaHR4NUpLaGp2d1J3T2tPTFJYMU9MU3o1eThK?=
 =?utf-8?B?bFh1Z0NPVkdNS25ucWlGbVNZQWxlU1lGVmc1a0c3MERNTy95dnpIWGJ3YzVI?=
 =?utf-8?B?RnN4Y0t2bHlMcHM3dnRkcmNLWlV5anQwOVdpT0lhdFRmMEdIbk1BVUZOdTd3?=
 =?utf-8?B?Y3dPS1hNbFRwT3BoWnpCUUY0eFByTEY5aXdIT0RoaFJRQisyU3F5dG12VjdJ?=
 =?utf-8?B?Z2VTRVVaL3U3eWJYbXVzT0RtU0NwcklKZnNqYW5vYWU3bi95THltR3FaRGtC?=
 =?utf-8?B?WmFsUGNoSXhsdDFWdlp1dldjMDN5eXM0ZmlGczhHZjlvKzNBbVQvREQzR3g1?=
 =?utf-8?B?SlZnZnlxZDBhY0hkOXJqd2FUN2ZTTFVKUldPL1pKMmszZklLS3ZoYlgxSXo2?=
 =?utf-8?B?dWhHbDZmejBFT1NZTjBEbVk2NXJnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f64139-79dc-4f3d-e382-08d9f77b4309
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 09:51:42.6926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tph4p/AsyO9bITiAr0YQNG5AkE40SWQ3I6+NI0K73/8kkOrFyFrIiZWphHFAatCaIUcRubchPxYGAx2hWtuF5b6HoTLxf5+yPrwUKK43t7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4787
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjQgNS82XSB3YXRjaGRvZzogcnpnMmxfd2R0OiBVc2UgZm9yY2UgcmVzZXQgZm9yIFdE
VA0KPiByZXNldA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFdlZCwgRmViIDIzLCAyMDIyIGF0
IDU6MDEgUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToN
Cj4gPiBUaGlzIHBhdGNoIHVzZXMgdGhlIGZvcmNlIHJlc2V0KFdEVFJTVEIpIGZvciB0cmlnZ2Vy
aW5nIFdEVCByZXNldCBmb3INCj4gPiByZXN0YXJ0IGNhbGxiYWNrLiBUaGlzIG1ldGhvZChpZSwg
R2VuZXJhdGUgUmVzZXQgKFdEVFJTVEIpIFNpZ25hbCBvbg0KPiA+IHBhcml0eSBlcnJvcilpcyBm
YXN0ZXIgY29tcGFyZWQgdG8gdGhlIG92ZXJmbG93IG1ldGhvZCBmb3IgdHJpZ2dlcmluZw0KPiA+
IHdhdGNoZG9nIHJlc2V0Lg0KPiA+DQo+ID4gT3ZlcmZsb3cgbWV0aG9kOg0KPiA+ICAgICAgICAg
cmVib290OiBSZXN0YXJ0aW5nIHN5c3RlbQ0KPiA+ICAgICAgICAgUmVib290IGZhaWxlZCAtLSBT
eXN0ZW0gaGFsdGVkDQo+ID4gICAgICAgICBOT1RJQ0U6ICBCTDI6IHYyLjUocmVsZWFzZSk6djIu
NS9yemcybC0xLjAwLTI3LWdmNDhmMTQ0MGMNCj4gPg0KPiA+IFBhcml0eSBlcnJvciBtZXRob2Q6
DQo+ID4gICAgICAgICByZWJvb3Q6IFJlc3RhcnRpbmcgc3lzdGVtDQo+ID4gICAgICAgICBOT1RJ
Q0U6ICBCTDI6IHYyLjUocmVsZWFzZSk6djIuNS9yemcybC0xLjAwLTI3LWdmNDhmMTQ0MGMNCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy93
YXRjaGRvZy9yemcybF93ZHQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvcnpnMmxfd2R0
LmMNCj4gDQo+ID4gQEAgLTExNywxNyArMTIwLDE0IEBAIHN0YXRpYyBpbnQgcnpnMmxfd2R0X3Jl
c3RhcnQoc3RydWN0DQo+ID4gd2F0Y2hkb2dfZGV2aWNlICp3ZGV2LCAgew0KPiA+ICAgICAgICAg
c3RydWN0IHJ6ZzJsX3dkdF9wcml2ICpwcml2ID0gd2F0Y2hkb2dfZ2V0X2RydmRhdGEod2Rldik7
DQo+ID4NCj4gPiAtICAgICAgIC8qIFJlc2V0IHRoZSBtb2R1bGUgYmVmb3JlIHdlIG1vZGlmeSBh
bnkgcmVnaXN0ZXIgKi8NCj4gPiAtICAgICAgIHJlc2V0X2NvbnRyb2xfcmVzZXQocHJpdi0+cnN0
Yyk7DQo+ID4gLQ0KPiANCj4gSSB0aGluayB0aGlzIHBhcnQgYmVsb25ncyBpbiBwYXRjaCA0LzYu
DQoNCkZvciBPdmVyZmxvdyBtZXRob2Qgd2UgbmVlZCB0byByZXNldCB0aGUgbW9kdWxlLCBzbyB0
aGF0IHdlIGNhbg0KdXBkYXRlIFdEVFNFVCByZWdpc3RlciB0byBjaGFuZ2UgdGhlIHRpbWVvdXQg
dmFsdWUgZnJvbSA2MHNlYyB0byA0My42OSBtc2VjLCANCnNvIHRoYXQgcmVib290IGNhbiBvY2N1
ciBhZnRlciA0My42OSBtc2VjIHdoaWNoIGNvcnJlc3BvbmRzIHRvIGNvdW50ZXIgdmFsdWUgb2Yg
MS4NCg0KV2hlcmUgYXMgb24gcGFyaXR5IGVycm9yIGNhc2UsIEdlbmVyYXRpbmcgcGFyaXR5IGVy
cm9yIA0KaW1tZWRpYXRlbHkgdHJpZ2dlciB0aGUgcmVib290LiBIZXJlIHdlIGRvbid0IG5lZWQg
dG8gcmVzZXQgdGhlIG1vZHVsZSwNCmZvciBHZW5lcmF0aW5nIHBhcml0eSBlcnJvciwgdGhhdCBp
cyB0aGUgcmVhc29uIGl0IGdvdCByZW1vdmVkIGluIHRoaXMgcGF0Y2guDQoNClJlZ2FyZHMsDQpC
aWp1DQoNCj4gDQo+ID4gICAgICAgICBjbGtfcHJlcGFyZV9lbmFibGUocHJpdi0+cGNsayk7DQo+
ID4gICAgICAgICBjbGtfcHJlcGFyZV9lbmFibGUocHJpdi0+b3NjX2Nsayk7DQo+ID4NCj4gPiAt
ICAgICAgIC8qIHNtYWxsZXN0IGNvdW50ZXIgdmFsdWUgdG8gcmVib290IHNvb24gKi8NCj4gPiAt
ICAgICAgIHJ6ZzJsX3dkdF93cml0ZShwcml2LCBXRFRTRVRfQ09VTlRFUl9WQUwoMSksIFdEVFNF
VCk7DQo+ID4gKyAgICAgICAvKiBHZW5lcmF0ZSBSZXNldCAoV0RUUlNUQikgU2lnbmFsIG9uIHBh
cml0eSBlcnJvciAqLw0KPiA+ICsgICAgICAgcnpnMmxfd2R0X3dyaXRlKHByaXYsIDAsIFBFQ1Ip
Ow0KPiA+DQo+ID4gLSAgICAgICAvKiBFbmFibGUgd2F0Y2hkb2cgdGltZXIqLw0KPiA+IC0gICAg
ICAgcnpnMmxfd2R0X3dyaXRlKHByaXYsIFdEVENOVF9XRFRFTiwgV0RUQ05UKTsNCj4gPiArICAg
ICAgIC8qIEZvcmNlIHBhcml0eSBlcnJvciAqLw0KPiA+ICsgICAgICAgcnpnMmxfd2R0X3dyaXRl
KHByaXYsIFBFRU5fRk9SQ0UsIFBFRU4pOw0KPiA+DQo+ID4gICAgICAgICByZXR1cm4gMDsNCj4g
DQo+IFRoZSByZXN0IExHVE0sIHRvDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0K
PiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVy
aG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51
eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcN
Cj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVz
IFRvcnZhbGRzDQo=
