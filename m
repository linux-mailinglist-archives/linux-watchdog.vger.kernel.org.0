Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF124D4162
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Mar 2022 07:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233320AbiCJGyM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 10 Mar 2022 01:54:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbiCJGyM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 10 Mar 2022 01:54:12 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2125.outbound.protection.outlook.com [40.107.114.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F2145ACF;
        Wed,  9 Mar 2022 22:53:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1Pc1nmssR4aSgZ1DT0lFmPwEdfmplRoworL7GWLmvnwGkXjCkmWF4YcIlXcS/B3dbspOzTvmPYj8DM/e0tqRw60d6QSrEe4SVwweR5pb90cDmeQL5sUN3F+4fjFsQzm/lS8Fj6UIhpVcPBNQfAWURR7snywpilPp5fCpWLKHs2D5CA4KGNM7l0aXZKiX/3xtk/veZvgFS9XRsSHMqm4Cst3ajDm5TTqfqnme1ThrwCQ4I6d7BAXhlJfAKHD1r9ydUp3c8NtSOa21IFgRqJKG7Ax6Zu4FbgZkHt1IuDtoDWRBN94ZFiikOp3npfZumkTcC3xbGL98neMrWhzPQuBzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0LswWjTfJoCJ3hb8Y2QCyEW0KwrOFzo883TEZKrLb4=;
 b=RDhe7W4u7oqRlqGvyPid34dmWmqes6PCcIaoLnWXHbaL+DMWnBXFh8I+WiQOsL9MLR5pLUImautLDVWRdZZwS74gCn3+/8jHYv43zDA4Lt7lqscKAkR/qb9kvs+Dq/HC3Dqw/CVZHFibJu1Z9DpKGVfU5krhVa9235m75nJZuoZlRwp4Je7GNWbwlXwq0FcAAiY0SQAOHa1Ss1EoqGA78GIh62JXQPUd3yy7LaDH7UZtP/aLQY8LpR2ZMdpkS5nxe8o3PgHojNxLr6EtOfAg52TpCz3A1yHfRtYsVsnax2hq9NY+IBr8zMAHfvQXAuHk5T6t9jGm4iJsrVFn9rkWcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0LswWjTfJoCJ3hb8Y2QCyEW0KwrOFzo883TEZKrLb4=;
 b=q2cjtAnMRoPc44HWGD79lwWRhvJJIWZLkPBjJyHjlNMa2ld87OJcDwvSPFRj8kdwu9CHFijqO0xVdvzUv28yis0n2UNK99+nDlB2YdP3gQZ5nGOAe6xpHfejeNWBxYJIP7YYoTVyi4E2PhsGKscWkcmj/TC4DyqlTGMF7uobg64=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB9299.jpnprd01.prod.outlook.com (2603:1096:604:1d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 06:53:08 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.023; Thu, 10 Mar 2022
 06:53:08 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 0/7] RZG2L_WDT Fixes and Improvements
Thread-Topic: [PATCH v5 0/7] RZG2L_WDT Fixes and Improvements
Thread-Index: AQHYKnCZrKtJ0aTHxkCr0aawkDygoKyzrFnwgAQdVwCAAHgicA==
Date:   Thu, 10 Mar 2022 06:53:08 +0000
Message-ID: <OS0PR01MB5922A34FA5421C83B0699B79860B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220225175320.11041-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922BE07E79DB3CF32B8D95C86089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <53821770-23b0-11ef-a76a-1e0beda01c42@roeck-us.net>
In-Reply-To: <53821770-23b0-11ef-a76a-1e0beda01c42@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9123475-a8a1-4264-3b92-08da0262a26d
x-ms-traffictypediagnostic: OSZPR01MB9299:EE_
x-microsoft-antispam-prvs: <OSZPR01MB9299518C8E32678E0A569059860B9@OSZPR01MB9299.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XZ5VbiXkTcwvh+6C7cwZ9Rxv0nNslKbJwrG3FnqjpdPakErasxJD2+ES4Ct/haBqFclp1g7u771sa82WZVY8z/qAw6H+fyKhpb5/lvtxH5V79SaDLm9jA8xCxvNcJybbV/v4MolW//jEJzbeAaIZUMgAHSWlu3ll3bHVRMuQ3rGbpMnXWOCngZrqkt0Wvoa8niC/jP5z47EKTU/eJgt3RpKob/ZOHCVulc5TIm8A6OBWMGTYVfrEXpf7zi2Wjw46QWA1WsOdlg6UiGbqktCp45EqcOWLvYXDpVSOwbk/xJ9UoRqki0RCxvwe4qqc7RIxo/skR+WKcKIZLZbNxLwfyRmD5rtv3nxrs0BMK0s1VOHOU/lX9Pgtf4mKs+CYF8TgfOjTrl0HmhvWk0ydYzJuFMfAPx1nwK6Ruuf2DycnFkWFiyG3eFYWXytftPrVLZ02Bp6mpP0NFVQdbNEXYxBc+6p4YR31A0eLXsuEv1y87AMI5FGKFE2uUw97M+NONsvt++G0U3T34CvrO2ukn6YxyXHqInpMB8zE83CaoxRf0QHhYGS0TqQMgMx8vIgwMJ/YaGb13m7j2a8t75qgzpfaFn1alT51WcLlY810h0sGqMr2EFjhxnufQ0i4ZobpZkGLZRhWmjMXRtnjRdLbDNZtyFTetDgn82UmJLtQyqZN6FKT5lR5rnVzT/eUP+BgIIph46i85zkM/EpmX1HCy4qUzQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(52536014)(83380400001)(508600001)(2906002)(38070700005)(86362001)(66446008)(66946007)(66556008)(64756008)(66476007)(5660300002)(316002)(54906003)(8676002)(110136005)(6506007)(33656002)(76116006)(9686003)(7696005)(55016003)(53546011)(186003)(26005)(38100700002)(122000001)(71200400001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVZBZG5yRWFYRU9CZHVhR3hFSVVoamYzNVFXcXl4Vld3dDVKRTRQUXRjOWVk?=
 =?utf-8?B?Y0FxcncxbVZ6c28zSlV5d0hWS1JWOVN6R3FUQW1LVGUvRThnYTJYYVNtbmZO?=
 =?utf-8?B?MFNSUDFQd3ZOUTY5QnpWbGxSMWRMQzZ5UU9MdlkzQzllc3RWajl5VXJpKzhw?=
 =?utf-8?B?d2RqYlhOUTBHVENONldPR1FhLzdHdFd2bkhhazFWTTQwdXhkMjR3V2k4SDBO?=
 =?utf-8?B?aGJzZjc4clY0VnVRUjVEUFk5WnNDK2EwZkhRc2RlcU9GTGVuMkJOZ2Vnd2dG?=
 =?utf-8?B?TzQvSVN3T3FsM0NGU1pBLzV3bVlhUDhFb3QrZ3krZG04Tk5YSC9tRmpGMnJL?=
 =?utf-8?B?cENwSWFqcVdoakNJdUJZTjAyc29ETEtTR3g3SExGNi9JajRDNFF4VlZrWUJE?=
 =?utf-8?B?UFRTUnRHSEZNTithRHA2d0ppaVJUSVU4K24zNjY2UDlRbFcxNm5vWW9wUzZn?=
 =?utf-8?B?T2xhZkdiSEcrQWwrcThoWjBsQWZpaDNHb3htdDB6RE9OUWx0MXBYQXFGcm9a?=
 =?utf-8?B?MlBwOXdwazQzRDRYZnY2RXo1YXRkNGYrbGdYUkxnd1pJczNUOUhGbHVndGdU?=
 =?utf-8?B?U3EweUdMZndoM2pUWkRZMTZZUDNZQzNBaWhwVmE1d3VSNldQK3Q3d0RvdTA0?=
 =?utf-8?B?S3FwVjVCZGUzaytYZ20wcHEvN3RrNTlsNjFGdlFtT2NFVFBXWWlaSjJGTnFk?=
 =?utf-8?B?Y2tRR0wvaXZYMFgzdmxTRGFtYWlTaVhEdE5xczlxNG8vVkNFUFZxTjRaTUpD?=
 =?utf-8?B?SW91YVJWR3lSdkpTSWRza1JBTkJtZEtSYURYTytJQXZPSDRaWGQxZ2lnKzVq?=
 =?utf-8?B?bG9ZZzRyQ2htUU5LVFlWOURZTnNmUFJDUWx1NHRLZVVJL2o5NUxTS2pJSGox?=
 =?utf-8?B?U215KzNpVTJPeWV5dEI3VDh4SHNkaStiYTJaeWNEODlueHZmYXB5VnFnVzZW?=
 =?utf-8?B?dlRSUlZkV0JBU2RmVjlEMWQwNlBoVW92SEx0MkZSZi9veG02bEU3VUpvVlNw?=
 =?utf-8?B?UWlGcDNKbU9CVndUc0IyemxvcnluRzBSaXhmS1c0cW1ndWpMMmxHYzgyYzNY?=
 =?utf-8?B?UEhQZWQ3RjFmWTdGZWZ2cjRUZEs1K3hzcG13RSs1dUVuczlSbCszV2dldkFC?=
 =?utf-8?B?VXkrMkFLV0JjM0IxdUp2RjByS3d0TE5IOEJkeGdnUG00d2ZWcFl4MlFTdXFm?=
 =?utf-8?B?aE9UcFBTL2hvRkZ5Uk5DNnFPMDdidGJ3R1IxTkRwOENIZjhHN1ZiY3krMzhB?=
 =?utf-8?B?UUd2ZXNQL3k5Q0ZaREt3Vkw1a2pIOGxvd3NTZzZiRGZjV3F0bVZrbzdhT3Rt?=
 =?utf-8?B?dnd2cldsT1I1ZGdxamkrY2VrY3E5anlpMWxEOHpVWERPRWdGSGFVUjlHMEpV?=
 =?utf-8?B?aDVadzdZTkRSa214dTVKODVRaUJaeGErM3hUOGh1MTV5elIxVUVJQ2hqZHY4?=
 =?utf-8?B?K1FvRjcwM3lobXdLT3pkUXJ6NHJrdFJQYWM2SUpvT0VBem9ISEY3bzJWVjBs?=
 =?utf-8?B?R2cyRkk5U1dBUlNEMkdJZmxWTmJlb3kzc2wwb2FXNzJ5Zkc5Ykk1WGdaa3ZH?=
 =?utf-8?B?SnIvbXVtZGw1aFk4SzhlUTg0UnY3WThnd0FldzNzbXFXQ3I5SE1JMEcwQXVB?=
 =?utf-8?B?VHdjMXZFc25OeXhLRm5PSUtTTzY3N3RqSjVpUkdKYWRvSVdsd1YxMmJld0Q5?=
 =?utf-8?B?Q3FOWDloMTlabmF5ckpKcFp0N2VJR2czdEg4azBDNUYzOUlHZ1B0UEp2ZkxB?=
 =?utf-8?B?UXRnOGM3Wml2dmU4MTBEWWthVEtmcEM2VGo5WGJidkJOVUVaaXgvdDQ4MUxL?=
 =?utf-8?B?WmJHUVUzckRQNHZGK3pSUTJkbUQycGZHY2MwR1lWcEdJSmVRRFdaM29SME5K?=
 =?utf-8?B?aitDNXQzUUx1NmFqYmZTYndncTRGUVhiRzRqcTRHRDlxRHpwVXhUY1NVRFpX?=
 =?utf-8?B?MzJnSFZMcXlQdW5BM1NJdHFhM3JlS3hjUWxNZmdCa0lCNWVlYnAzK29Rc1Vz?=
 =?utf-8?B?L3pETFBlZHYzd2l6LzVicVpSeUhPdUlWUGdrQUtFMDlHVUJaR2xlM2Y1WHFC?=
 =?utf-8?B?aTVpU09KYzJvY1U0dGJwTVA0ek5RSkVSRTBTNURFUzNEV1I5SXdIdXBZcE1Q?=
 =?utf-8?B?clJhQ0tDY1RjNk44WDZzOHlQUHZQR2p4bUNlaWNHSElQeG1EWXRTRysxUkxB?=
 =?utf-8?B?ZDk0Y3lvWXN6Zlh0ZUtuTTV6T3RDMEEzUC94dVpMUjYxSmc3azlxdDQyQ1VR?=
 =?utf-8?B?bHlSZWhYaEt3RlhqWmVrSW42aU1RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9123475-a8a1-4264-3b92-08da0262a26d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 06:53:08.0683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 66GmVdhbBMIsrH4XKG+YvYsUE0DTSKboaQvAlNOAW27R5vOpSOAz/XKkw/n4dbLpV05Slu9QangUWnuG0+zIGSKqbFZlXlzmBpBCqbV6MrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9299
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR3VlbnRlciwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAvN10gUlpHMkxfV0RUIEZp
eGVzIGFuZCBJbXByb3ZlbWVudHMNCj4gDQo+IE9uIDMvNy8yMiAwMDo1MiwgQmlqdSBEYXMgd3Jv
dGU6DQo+ID4gSGkgQWxsLA0KPiA+DQo+ID4gR2VudGxlIHBpbmcuIEFyZSB3ZSBoYXBweSB3aXRo
IHRoaXMgcGF0Y2ggc2VyaWVzPw0KPiA+DQo+ID4gUGxlYXNlIGxldCBtZSBrbm93Lg0KPiA+DQo+
IA0KPiBTaG91bGQgYmUgZ29vZCB0byBnby4gSSBhZGRlZCB0aGUgc2VyaWVzIHRvIG15IHdhdGNo
ZG9nLW5leHQgYnJhbmNoLg0KPiBVc3VhbGx5IFdpbSBwaWNrcyBpdCB1cCBmcm9tIHRoZXJlLg0K
DQpUaGFua3MsDQpCaWp1DQoNCj4gPj4gU3ViamVjdDogW1BBVENIIHY1IDAvN10gUlpHMkxfV0RU
IEZpeGVzIGFuZCBJbXByb3ZlbWVudHMNCj4gPj4NCj4gPj4gVGhlIGZpcnN0IDQgcGF0Y2ggaW4g
dGhpcyBzZXJpZXMgZml4ZXMgdGhlIGJlbG93IGlzc3Vlcw0KPiA+PiAxKSAzMiBiaXQgb3ZlcmZs
b3cgaXNzdWUNCj4gPj4gMikgUnVudGltZSBQTSB1c2FnZSBjb3VudCBpc3N1ZQ0KPiA+PiAzKSBC
VUc6IEludmFsaWQgY29udGV4dCBkdXJpbmcgcmVzZXQuDQo+ID4+IDQpIFJlc2V0IGNvbnRyb2wg
aW1iYWxhbmNlDQo+ID4+DQo+ID4+IFRoZSBsYXRlciAzIHBhdGNoZXMgYXJlIGVuaGFuY2VtZW50
cyB0byB0aGUgV0RUIGRyaXZlci4NCj4gPj4gMSkgQWRkaW5nIGVycm9yIGNoZWNrIGZvciByZXNl
dF9jb250cm9sX2RlYXNzZXJ0KCkgYW5kIGZpeGluZw0KPiA+PiByZXNldF9jb250cm9sIGltYmFs
YW5jZS4NCj4gPj4gMikgR2VuZXJhdGUgUGFyaXR5IGVycm9yIGZvciBXRFQgcmVzZXQNCj4gPj4g
MykgQWRkIHN1cHBvcnQgZm9yIHNldF90aW1lb3V0IGNhbGxiYWNrDQo+ID4+DQo+ID4+IHY0LT52
NToNCj4gPj4gICAqIFVwZGF0ZWQgY29tbWl0IGRlc2NyaXB0aW9uIG9mIHBhdGNoIzQNCj4gPj4g
ICAqIEFkZGVkIFJiIHRhZyBmcm9tIEdlZXJ0Lg0KPiA+PiAgICogU2VwYXJhdGVkIHJlc2V0IGNv
bnRyb2wgaW1iYWxhbmNlIGZyb20gcGF0Y2gjNA0KPiA+Pg0KPiA+PiBCaWp1IERhcyAoNyk6DQo+
ID4+ICAgIHdhdGNoZG9nOiByemcybF93ZHQ6IEZpeCAzMmJpdCBvdmVyZmxvdyBpc3N1ZQ0KPiA+
PiAgICB3YXRjaGRvZzogcnpnMmxfd2R0OiBGaXggUnVudGltZSBQTSB1c2FnZQ0KPiA+PiAgICB3
YXRjaGRvZzogcnpnMmxfd2R0OiBGaXggJ0JVRzogSW52YWxpZCB3YWl0IGNvbnRleHQnDQo+ID4+
ICAgIHdhdGNoZG9nOiByemcybF93ZHQ6IEZpeCByZXNldCBjb250cm9sIGltYmFsYW5jZQ0KPiA+
PiAgICB3YXRjaGRvZzogcnpnMmxfd2R0OiBBZGQgZXJyb3IgY2hlY2sgZm9yIHJlc2V0X2NvbnRy
b2xfZGVhc3NlcnQNCj4gPj4gICAgd2F0Y2hkb2c6IHJ6ZzJsX3dkdDogVXNlIGZvcmNlIHJlc2V0
IGZvciBXRFQgcmVzZXQNCj4gPj4gICAgd2F0Y2hkb2c6IHJ6ZzJsX3dkdDogQWRkIHNldF90aW1l
b3V0IGNhbGxiYWNrDQo+ID4+DQo+ID4+ICAgZHJpdmVycy93YXRjaGRvZy9yemcybF93ZHQuYyB8
IDgzICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tDQo+IC0NCj4gPj4gICAxIGZp
bGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+
IC0tDQo+ID4+IDIuMTcuMQ0KPiA+DQoNCg==
