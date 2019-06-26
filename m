Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5780657087
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Jun 2019 20:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfFZS1F (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 26 Jun 2019 14:27:05 -0400
Received: from mail-eopbgr30080.outbound.protection.outlook.com ([40.107.3.80]:14708
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726104AbfFZS1E (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 26 Jun 2019 14:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YAgtUtLzQChU+aP7OHcdWPngo9WpusF+5t7dAyJJEg=;
 b=pxniQazORQoQzEveGKsUrhq6iAeIMyYDJeCJLmyh6xlASRLAhvpID2YMVQfqM71pELibUOJ8DvmpybGPLiMPwU2Sq40FQgMVsSykb3TT6OZAZamIGEM/SZIeSlCOl6/KuY2LVzQGCNfnoxIj0+0n5O9dzcyDj6C/moOYPl29n5A=
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com (52.133.60.17) by
 AM0PR06MB6417.eurprd06.prod.outlook.com (10.186.130.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 18:27:00 +0000
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::5590:e3b3:5416:e9eb]) by AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::5590:e3b3:5416:e9eb%5]) with mapi id 15.20.2008.014; Wed, 26 Jun 2019
 18:27:00 +0000
From:   Melin Tomas <tomas.melin@vaisala.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH] watchdog: cadence: Support all available prescaler values
Thread-Topic: [PATCH] watchdog: cadence: Support all available prescaler
 values
Thread-Index: AQHVK1/XA87KPv3AR0aVKfsrVv0YIKas4bEAgAFhCQA=
Date:   Wed, 26 Jun 2019 18:27:00 +0000
Message-ID: <a80da374-47ea-3d0b-bdf9-ed7a5a9f6a26@vaisala.com>
References: <20190625141048.99479-1-tomas.melin@vaisala.com>
 <20190625212324.GA8823@roeck-us.net>
In-Reply-To: <20190625212324.GA8823@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0701CA0084.eurprd07.prod.outlook.com
 (2603:10a6:3:64::28) To AM0PR06MB4066.eurprd06.prod.outlook.com
 (2603:10a6:208:b8::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tomas.melin@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 524cdd53-90a6-4227-7032-08d6fa63e0fb
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR06MB6417;
x-ms-traffictypediagnostic: AM0PR06MB6417:
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-microsoft-antispam-prvs: <AM0PR06MB64172D9273EA9F009BA92884FDE20@AM0PR06MB6417.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(396003)(39850400004)(366004)(376002)(199004)(189003)(186003)(71190400001)(7736002)(305945005)(6436002)(71200400001)(36756003)(6486002)(99286004)(2906002)(25786009)(11346002)(52116002)(53936002)(81156014)(81166006)(26005)(76176011)(6246003)(386003)(6506007)(53546011)(8676002)(2616005)(86362001)(446003)(486006)(6512007)(102836004)(256004)(68736007)(8936002)(476003)(229853002)(14454004)(6916009)(54906003)(316002)(31696002)(31686004)(73956011)(5660300002)(3846002)(6116002)(66946007)(4326008)(66556008)(64756008)(66446008)(66476007)(66066001)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB6417;H:AM0PR06MB4066.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CHb25EtIOFLATtOBixSzbmAbWoT1avPTm4QlQ019+Mljd65W82h1/TPU0OGSUiKkunTk/Ji3+1qwZ83VdGWdekt3jtnu33djlRMBVATasmrpgQ2OORQq/7R5a55eJvI6/WYoHUHEHQ0jjSQ4MhHafXmHAYIjvJI1p+ihgA70WcIdWDm3x3C37fDMCfzuSI04cLWNr4au3BCERKBtpY/TUi/dMa5xq4pNVeC61xJ7udhj4OKszYlXtaqo/OrENmjOkGskl8hGTBLi+V9phdgM1IEfoJYuRwlzeRKIHRo59cvcH+zJoa9m5JQN9nu/6x7jRZTNvdGBeV7WzdJzwFVHu5brKl0DnqLtlKRNDhut6NI7maBLvcdfBjZYPvcxslYUZ8vqoG7Ou2rl54PH5lnwdYGRPfs+Bc895wGPaR3eFUE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BB67B52F26110429F378745CAE06B96@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 524cdd53-90a6-4227-7032-08d6fa63e0fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 18:27:00.5203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tomas.melin@vaisala.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6417
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gNi8yNi8xOSAxMjoyMyBBTSwgR3VlbnRlciBSb2VjayB3cm90ZToNCg0KPiBPbiBUdWUsIEp1
biAyNSwgMjAxOSBhdCAwMjoxMToxMVBNICswMDAwLCBNZWxpbiBUb21hcyB3cm90ZToNCj4+IENh
ZGVuY2Ugd2F0Y2hkb2cgSFcgc3VwcG9ydHMgcHJlc2NhbGVyIHZhbHVlcyBvZg0KPj4gOCwgNjQs
IDUxMiBhbmQgNDA5Ni4gRm9yIGxvdyBmcmVxdWVuY3kgaW5wdXQgY2xvY2tzLCB0aGUgc21hbGxl
cg0KPj4gcHJlc2NhbGVyIHZhbHVlcyBhcmUgcHJlZmVycmFibGUgdG8gaW1wcm92ZSB0aGUgZ3Jh
bnVsYXJpdHkgYW5kDQo+PiBleHRlbmQgdGhlIHRpbWVvdXQgcmFuZ2UgdG93YXJkcyB0aGUgbG93
ZXIgZW5kLg0KPj4NCj4+IFByZXNjYWxlciBsb2dpYyBpcyBleHRlbmRlZCB0byBzdXBwb3J0IHRp
bWVvdXQgdmFsdWVzIFsxcyAtIDQwOTVzXSwNCj4+IHdpdGggcHJlc2NhbGVyIHNlbGVjdGVkIGJh
c2VkIG9uIGlucHV0IGNsb2NrIGZyZXF1ZW5jeS4NCj4+IEZvciBjbG9jayBmcmVxdWVuY2llcyBo
aWdoZXIgdGhhbiB+MiBNSHosIHRoZSBsYXJnZXN0IHByZXNjYWxlcg0KPj4gdmFsdWUgaXMgdXNl
ZC4NCj4+DQo+IEkgaGF2ZSB0d28gcHJvYmxlbXMgd2l0aCB0aGlzIHBhdGNoOg0KPg0KPiAiaW1w
cm92ZSB0aGUgZ3JhbnVsYXJpdHkgYW5kIGV4dGVuZCB0aGUgdGltZW91dCByYW5nZSB0b3dhcmRz
IHRoZSBsb3dlcg0KPiBlbmQiIHN1Z2dlc3RzIHRoYXQgdGhlIHRpbWVvdXQgaXMgbm90IGFsd2F5
cyBzZWxlY3RlZCBpbiBtdWx0aXBsZXMgb2YNCj4gb25lIHNlY29uZC4gU2luY2UgdGhlIHNldC10
aW1lb3V0IGZ1bmN0aW9uIGlzIHN1cHBvc2VkIHRvIHJldHVybiB0aGUNCj4gYWN0dWFsbHkgc2Vs
ZWN0ZWQgdGltZW91dCwgdGhpcyBwb2ludHMgdG8gYSBwb3NzaWJsZSBidWcuDQo+DQo+IEFsc28s
ICJleHRlbmRlZCB0byBzdXBwb3J0IHRpbWVvdXQgdmFsdWVzIFsxcyAtIDQwOTVzXSIgaXMgYXQg
dGhlIHZlcnkNCj4gbGVhc3QgbWlzbGVhZGluZyBzaW5jZSB0aW1lb3V0cyBsYXJnZXIgdGhhbiA1
MTYgc2Vjb25kcyBhcmUgbm90IHNlbGVjdGFibGUNCj4gZXZlbiBhZnRlciB0aGlzIHBhdGNoIGhh
cyBiZWVuIGFwcGxpZWQgKHNlZSBDRE5TX1dEVF9NQVhfVElNRU9VVCBhbmQgaXRzDQo+IHVzZSku
DQo+DQo+IEkgYW0gbm90IG9wcG9zZWQgdG8gbWFraW5nIGJldHRlciB1c2Ugb2YgdGhlIHByZXNj
YWxlciwgYnV0IGl0IG5lZWRzDQo+IHRvIGJlIGRvY3VtZW50ZWQgcHJvcGVybHksIGFuZCBpZiB0
aGUgdGltZW91dCBncmFudWxhcml0eSBpcyBsYXJnZXINCj4gdGhhbiAxIHNlY29uZCwgdGhlIGFj
dHVhbCB0aW1lb3V0IG5lZWRzIHRvIGJlIGNhbGN1bGF0ZWQgYW5kIHJlZmxlY3RlZA0KPiBpbiB3
ZGQtPnRpbWVvdXQuDQoNClRoYW5rcyBmb3IgdmFsdWFibGUgZmVlZGJhY2suIEknbGwgY2hlY2sg
YW5kIHJld29yayB0aGlzIGFuZCBnZXQgYmFjayB3aXRoDQoNCmFuIHVwZGF0ZWQgdmVyc2lvbi4N
Cg0KDQp0aGFua3MsDQoNClRvbWFzDQoNCg0K
