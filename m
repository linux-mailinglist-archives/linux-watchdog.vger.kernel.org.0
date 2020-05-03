Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987241C2DE2
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 May 2020 18:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728729AbgECQOA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 3 May 2020 12:14:00 -0400
Received: from mail-eopbgr70089.outbound.protection.outlook.com ([40.107.7.89]:13312
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728665AbgECQOA (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 3 May 2020 12:14:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIo+KvN4mrAXorVBIhwOeH3qvXsiWMDBLFbyc2C3n6VpBmG30hBFZHSLzbjg0rY14R+8XT8WUzHZKGuK67zO7sh8oJUz1XMFnJh5sYE9bEbjKOfAXkFkiL+LtWnA/Lk5O+PiCHOKD5uJ4+C80e5Wtgea5bJgPr6N84XV4JTTy/jWZ/H/aDezln/Lp+6To+aU18b1hKWA/5RzAh1E0pKwcE2+Y7WzwFaOhqWEWrF5WnTZ8wn+ZqoDnW1qSmhWgKuAb0E+Wg3fNPPvYFQ6iwdbJAruWymFYc6FNa1rr36txET1A3O+gGKreZB3gRvwXWuLmQQ1fDd3xXuZwrSx83l0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1OLwYUYRYUjIYsuC/Wm5cTkFZwRQXMXjO50Mi+PBHE=;
 b=NROEBTRrsLMixDNXixmAC9XTq8vrVUYA8cy1Rya7I6qfOT0KMGIFvYoysUrxmLD6dNILPazTBGq9tam/wfT4qMh5X+MMvn066B48YlvhGIRN8k6Pm/bsNTzemSSQqv6KWJ7ZJz0Mmhvacil/1eCIlRpnuFqJY338+JDLpvFQ91WHkk0ku70xtU5htn+rr4FHcfICXeHpFfGwFhnnlioNDtR78+IbKaKbsqwnJ4L1SWmR2EmwsoJRevqgGTF9DjXH85RsisQIiDPb8oIUXfK+92pZqUf8kwDEY7NBz375nnOUiiA4gOD7gJbXxZmgrpOLeApuAjiqBrr6zH7eYLKFeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1OLwYUYRYUjIYsuC/Wm5cTkFZwRQXMXjO50Mi+PBHE=;
 b=JKOBWoS9zHlJQ7vX9DY3ScnxO7J3UftlnJibwa+G4q3kCYtv7jhXSaYgsr4ImYQfFHyDjodsc+AKztVBKOPjtkmGG7Ry+S6Uy8RWRec4BHcgEPGZlXJO8FBmj2RiohXVXo7mHDr0hWFalhlyJ1GNz18QeudkZetcDB8vs3Ixd5c=
Received: from AM6PR05MB6168.eurprd05.prod.outlook.com (2603:10a6:20b:2a::21)
 by AM6PR05MB4984.eurprd05.prod.outlook.com (2603:10a6:20b:4::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Sun, 3 May
 2020 16:13:55 +0000
Received: from AM6PR05MB6168.eurprd05.prod.outlook.com
 ([fe80::7ce1:9f42:460e:b1f3]) by AM6PR05MB6168.eurprd05.prod.outlook.com
 ([fe80::7ce1:9f42:460e:b1f3%5]) with mapi id 15.20.2958.029; Sun, 3 May 2020
 16:13:55 +0000
From:   Michael Shych <michaelsh@mellanox.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v3 0/4] support watchdog with longer timeout period
Thread-Topic: [PATCH v3 0/4] support watchdog with longer timeout period
Thread-Index: AQHWIQyFN+OYUXCPX0Oh/4skwNpE26iWiK4AgAAASvA=
Date:   Sun, 3 May 2020 16:13:54 +0000
Message-ID: <AM6PR05MB6168FA74FF9554A3E33601D1D9A90@AM6PR05MB6168.eurprd05.prod.outlook.com>
References: <20200503053424.31943-1-michaelsh@mellanox.com>
 <CAHp75Vff-xe06L1xOc9jMii+kEPJZzmiPBFPVMkeD46v0QW+hw@mail.gmail.com>
In-Reply-To: <CAHp75Vff-xe06L1xOc9jMii+kEPJZzmiPBFPVMkeD46v0QW+hw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [93.173.116.239]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1a76fc84-6d9b-48b3-849c-08d7ef7cfa5b
x-ms-traffictypediagnostic: AM6PR05MB4984:|AM6PR05MB4984:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR05MB4984601FF741B99EA4A08311D9A90@AM6PR05MB4984.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-forefront-prvs: 0392679D18
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WcIV7XJf8LIr0QApWUigKzfXJyjH4T1mPv9wFsa+mw6aps7nv2wdxRINzKSq6s4HsXtCKMoKHnfpRl2jjENDAEtpXGo+HWx+KgTMgny3NF0KMbmrCU5CK3dfcNtMPbN1/Z/XQ/+PqohoIkRlu94166jD8H13/JWzJwrQePrC/Bn0B9dmmVNs539tr8J8TacCc71Jib8vUa7h55XQuHKbCzSWq92YMM1FQ9+YF890yDwEXG6XYFaiY9Q9YwevnRKBnnVXFSw/RwpDKF8721J6JetEgQG57u/Y/xFcesmEvbt5O3bZv8WiCE9hRB+YrWfwhZ6PlUZHogFZb5nOXd/zsYtMA8jCeAnXSTxYah+JZjs1UgOfDjszwvyMh2vEWQOugSNZ5JZ2ELKo8gVJ2hYnjFcdvGEDUJ/vdnJqV7xkQoZnDVmxuPAlJPemB1tZ0Quy9RcdP/D21t9xO6o2ARPGaLTq4ns/MNXU+scXQOu5Gq27PkV3yliUJ7SS1DV52H6N
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB6168.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(55016002)(8936002)(66476007)(64756008)(86362001)(66556008)(66446008)(4326008)(478600001)(107886003)(9686003)(5660300002)(33656002)(8676002)(52536014)(6916009)(54906003)(316002)(71200400001)(76116006)(7696005)(186003)(26005)(53546011)(6506007)(66946007)(2906002)(148743002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: up8vnT8QoImXGhpZwOAR7c48vMMHsXc2oPTziCNmDjBAex1wub+VOMVq2Tr4+/FVx/lOwhy6+Kuzz4DxZ4D+/W0mVW7cJWYOrXd6BHgo60bg/u7aCTAMs/uz+9z8SBpJsK9D92AmNWt1oLIpI268HrDVDAMhOq8DkiZRQEGAUQyJqhwl3MNqgAgg59g+cfV/qbXK6LWzy2tgNkNAms2vWfrto3dOzBDwrCplUr5OAPfpf57H9WnOHBt1jPxyGCMPrjTgaimiD7xDlRt7DsO4z/zeOP4GITTaouqWzc6zp1rWKTg4pClqhZSwFcHsIMd1WDRZXfBkiRdTa8BSI4ToegsRtjQlxKWZsrkYSDVhoG7+nVS5nhygP4bU1NpXqEzcEBW873tGs9VUeG9DfZfvN+cL/RVCPJIbEj71gcLLnONtf6qng8d1cIRR4BOAZpcxayFSBN1forM2SgKU8yqGaQs/yRPnErevaQKZZeXu+6T0aZkm8RMi4vuueVZoBjwhgmtHoN3pbO+DV5Lqq8eM9QgYDCiEjVSmI5hSZvOitnriUO2UEOxqngY18+S9Fygb3XBRaJ8yWZgFwq7YeQuOzL36Lvb2n7k/W9Kp/NJB87SybTyLdRnDEtGdH9ghNa2m2YQqOCkeIXhFg3SDbgj7y2064sCanqMSumxhUjHO+LcaFeGj2EdfiAeEGMx2YRJhSe/UvY/jVuHHWwsl+PQ8TU3N3K/qxf2itJTbbFS0qeGuhIy4V4WfPDNm/8KVNsk0FVTms713q23iMLUZN/LX+OMmXciivq/YwY72t8KMIKE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a76fc84-6d9b-48b3-849c-08d7ef7cfa5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2020 16:13:55.0100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kyHrYGj/qKbK3quTmjC+jR7srN96JB1VIcAQLH9xMimmWjRgm/GfuyfTw+aTl/a6w/GehPNrxKNrsRDSUHcNRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB4984
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBTZW50OiBTdW5kYXksIE1heSAzLCAyMDIw
IDc6MTEgUE0NCj4gVG86IE1pY2hhZWwgU2h5Y2ggPG1pY2hhZWxzaEBtZWxsYW5veC5jb20+DQo+
IENjOiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+OyBXaW0gVmFuIFNlYnJvZWNr
IDx3aW1AbGludXgtDQo+IHdhdGNoZG9nLm9yZz47IEFuZHkgU2hldmNoZW5rbyA8YW5keUBpbmZy
YWRlYWQub3JnPjsgRGFycmVuIEhhcnQNCj4gPGR2aGFydEBpbmZyYWRlYWQub3JnPjsgbGludXgt
d2F0Y2hkb2dAdmdlci5rZXJuZWwub3JnOyBQbGF0Zm9ybSBEcml2ZXINCj4gPHBsYXRmb3JtLWRy
aXZlci14ODZAdmdlci5rZXJuZWwub3JnPjsgVmFkaW0gUGFzdGVybmFrDQo+IDx2YWRpbXBAbWVs
bGFub3guY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDAvNF0gc3VwcG9ydCB3YXRjaGRv
ZyB3aXRoIGxvbmdlciB0aW1lb3V0IHBlcmlvZA0KPiANCj4gT24gU3VuLCBNYXkgMywgMjAyMCBh
dCA4OjM0IEFNIDxtaWNoYWVsc2hAbWVsbGFub3guY29tPiB3cm90ZToNCj4gPg0KPiA+IEZyb206
IE1pY2hhZWwgU2h5Y2ggPG1pY2hhZWxzaEBtZWxsYW5veC5jb20+DQo+ID4NCj4gPiBUaGlzIHBh
dGNoc2V0IGFkZHMgc3VwcG9ydCBvZiBleHRlbmRlZCBuZXcgd2F0Y2hkb2cgdHlwZSAzIG9mIE1l
bGxhbm94DQo+ID4gRXRoZXJuZXQgYW5kIEluZmluaWJhbmQgc3dpdGNoIHN5c3RlbXMuDQo+ID4g
VGhpcyB0eXBlIG9mIHdhdGNoZG9nIGNhbiBoYXZlIGEgdGltZW91dCBwZXJpb2QgbG9uZ2VyIHRo
YW4gMjU1IG9yIDMyIHNlYy4NCj4gPiBhcyBpdCB3YXMgYmVmb3JlLg0KPiA+DQo+IA0KPiBJZiB5
b3UgaWdub3JlIG15IHRhZ3MsIHdoeSBhcmUgeW91IGJvdGhlcmluZyBhYm91dCBjaGFuZ2VzIGF0
IGFsbD8NCg0KU29ycnkgdGhhdCBJIG1pc3NlZCBpdC4NClNob3VsZCBJIHJlc2VuZCB0aGlzIHBh
dGNoc2V0Pw0KSWYgeWVzLCBhcyBzdGlsbCB2MyBvciBuZXcgb25lIHY0Pw0KDQo+IA0KPiA+IE1p
Y2hhZWwgU2h5Y2ggKDQpOg0KPiA+ICAgcGxhdGZvcm1fZGF0YS9tbHhyZWc6IHN1cHBvcnQgbmV3
IHdhdGNoZG9nIHR5cGUgd2l0aCBsb25nZXIgdGltZW91dA0KPiA+ICAgICBwZXJpb2QNCj4gPiAg
IHBsYXRmb3JtL3g4NjogbWx4LXBsYXRmb3JtOiBzdXBwb3J0IG5ldyB3YXRjaGRvZyB0eXBlIHdp
dGggbG9uZ2VyDQo+ID4gICAgIHRpbWVvdXQNCj4gPiAgIHdhdGNoZG9nOiBtbHgtd2R0OiBzdXBw
b3J0IG5ldyB3YXRjaGRvZyB0eXBlIHdpdGggbG9uZ2VyIHRpbWVvdXQNCj4gPiAgICAgcGVyaW9k
DQo+ID4gICBkb2NzOiB3YXRjaGRvZzogbWx4LXdkdDogQWRkIGRlc2NyaXB0aW9uIG9mIG5ldyB3
YXRjaGRvZyB0eXBlIDMNCj4gPg0KPiA+ICBEb2N1bWVudGF0aW9uL3dhdGNoZG9nL21seC13ZHQu
cnN0ICAgfCAgMTAgKysrKw0KPiA+ICBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9tbHgtcGxhdGZvcm0u
YyAgfCAxMDYNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGRyaXZlcnMv
d2F0Y2hkb2cvbWx4X3dkdC5jICAgICAgICAgICB8ICA3MyArKysrKysrKysrKysrKysrKysrKy0t
LS0NCj4gPiAgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL21seHJlZy5oIHwgICA1ICstDQo+
ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTgyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0K
PiA+DQo+ID4gLS0NCj4gPiAyLjExLjANCj4gPg0KPiANCj4gDQo+IC0tDQo+IFdpdGggQmVzdCBS
ZWdhcmRzLA0KPiBBbmR5IFNoZXZjaGVua28NCg==
