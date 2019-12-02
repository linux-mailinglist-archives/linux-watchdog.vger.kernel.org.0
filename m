Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C68110EBB2
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2019 15:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfLBOot (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Dec 2019 09:44:49 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.65]:60343 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727362AbfLBOos (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Dec 2019 09:44:48 -0500
Received: from [46.226.52.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.eu-west-1.aws.symcld.net id A1/85-12286-D5325ED5; Mon, 02 Dec 2019 14:44:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFJsWRWlGSWpSXmKPExsWSoc9hohur/DT
  W4FGMxaqpO1ksbqzbx27xZOEZJosPu64yWzx++Y/ZgdVj5Zo1rB79fw08dn5vYPf4vEkugCWK
  NTMvKb8igTXj0t3SghmiFR/WdDM3MH4R6WLk4mAUWMoscWHiFBYI5xiLxJ+ZXUwQzmZGid+9P
  9lAHBaBE8wSD5Z9AcsICUxlkmjbs4QdwnnAKHH4ZiNzFyMnB5uAhcTkEw/AWkQEmoH6l05gBX
  GYBR4ySuyZ18wGUiUsYC+x9e8SMFtEwEFi2YPP7BB2tMT036tZQWwWARWJOQsPgE3lFUiUOPN
  1KhvEuuvMEnfaVoA1cAI1N1w6C1bEKCAr8aVxNZjNLCAucevJfCYQW0JAQGLJnvPMELaoxMvH
  /1gh6lMlTjbdYISI60icvf4EylaSmDf3CJQtK3FpfjeU7Ssxcd5LNpj677euQM23kFjS3QoMP
  w4gW0Xi36FKiHCBxPKv79ghbDWJKes/MUOUyEjs/GkM8oqEwC1WiR8HD7NMYNSfheTqWUBlzA
  KaEut3QYUVJaZ0P2SfBQ4JQYmTM5+wLGBkWcVokVSUmZ5RkpuYmaNraGCga2hopGtoaaFrZGS
  gl1ilm6SXWqpbnlpcomuol1herFdcmZuck6KXl1qyiRGYoFIKjt3Zwdj24a3eIUZJDiYlUd6/
  n5/ECvEl5adUZiQWZ8QXleakFh9ilOHgUJLgfaj4NFZIsCg1PbUiLTMHmCxh0hIcPEoivOdB0
  rzFBYm5xZnpEKlTjMYcE17OXcTMcWTu0kXMQix5+XmpUuK8bUpApQIgpRmleXCDYEn8EqOslD
  AvIwMDgxBPQWpRbmYJqvwrRnEORiVh3tUgU3gy80rg9r0COoUJ6BTzlkcgp5QkIqSkGpiaOI7
  GTGLjPWC/wyXhVUK4Vdks08hnUjMCmGsrH2vOjK38O3HJvIzLDrrO4tNsNx/7cfyauWlF6Uk1
  q9bCZVv+it9crHHxhs7cTWEn/R4Yxj40buWffE+5te7Y5Fsv2yfYl0xwE2KQu9FtxMBY4dcsN
  qe78c4L9gmOfxzWbFBfPjlScEn4trfxu+8cnLPVcNu1ss5j3bffv/d84TDn89wzRa8VXQ22i9
  8T9XUX3m15gLlws4r5HbEW5gzX/o8Hn7qXH/0T5b6zy+ZRTKu+UFv38+dKp1r+PPktvKe1dFb
  zdemFAj8yBYN3sElacbc5KrrNOPFyiu76KyJ9fTY8jfkvN669bxaV/EPsQ6jDg5dKLMUZiYZa
  zEXFiQByliQXXQQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-25.tower-282.messagelabs.com!1575297884!1405141!1
X-Originating-IP: [104.47.8.52]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13668 invoked from network); 2 Dec 2019 14:44:44 -0000
Received: from mail-am5eur03lp2052.outbound.protection.outlook.com (HELO EUR03-AM5-obe.outbound.protection.outlook.com) (104.47.8.52)
  by server-25.tower-282.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Dec 2019 14:44:44 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/O2fNcgQe01mM5w63R2/KTLjCkESggdFhuPm2Y7uILvSKpiUPpulV5QAsauo9oomfvvtocHP/Ilqhd0iom1L8dgLanag7wXDxVLry6zno18jVSWHv6YmaUnsRihVemz5jqF/nMNzfgmuB7QqfT8jtXW6BCRt+vz9bgWJhgTGTgOkSXlNaIcmnXHmMi33KKZdM2tXRUOVX7/wmKEF+eA5YUx9iDplse198ve+s6xZELT7hgk5WRThshOnLhT1lwpZgumcWv4lkGEXiBD+lr4zAyfb8C1pJq31RGwOoikbd1HpXzV+Xw5WrI/EashyNWKsjApZJYSGkpBHDQ3+9uv2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9hMQzQfxSqfv7wWuIA0YGY644/1dflMmfopA7MLNmE=;
 b=d1vXGyxdITN5yvicV4Fj7RlKqvEnE2t8KCwuadwR4vtqa3stq4xc/gEO7tVHWozFFudFwPrIv9b0x28c/NLgP4WGgKmUSh/nHjl6oc9waWc3Mb2hfpIQeFvSrFIGsreL5h8uoy2VxIIp1gT+3MxGsSlVvg96Y61YdsvbvAOsUC8UDEqQEXu+VeejWR6N0djlDjBy7AgK4F2nxYS+xC2VdeXThX6IbqH7sA2CGSc+NV99G5x9L3BAY8hWEsGnIKT3mIn9/X9dS25+Kmaooot4QkubpKKnE5Y5Rn2klxGjC6bJjYw6bA2KfMqmZYoQe+sjhdpd77crMVbUyo1yDL7eNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9hMQzQfxSqfv7wWuIA0YGY644/1dflMmfopA7MLNmE=;
 b=dmNo8jaBFHD7Mb6W9gAIqonjhPnlt7Zr6hw9wi/3rg/63dA9i5xC9uwuxjjC+SLA2BGV105HEp8v9yfG25NItuXnnZm6ZQOphdFiF03eO9AQWAegHTokK6jqmO8onZsZIPm92S1EiOO8Qp5jinFdjFCUKA2QaZZ88NW5D80yNec=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1028.EURPRD10.PROD.OUTLOOK.COM (10.169.154.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.21; Mon, 2 Dec 2019 14:44:44 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 14:44:43 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Marco Felsch <m.felsch@pengutronix.de>
CC:     Support Opensource <Support.Opensource@diasemi.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH] watchdog: da9062: add power management ops
Thread-Topic: [PATCH] watchdog: da9062: add power management ops
Thread-Index: AQHVphAFwdyccq+61U6+GK1Hr/H0vaemod1wgAAQYwCAAAQN0IAAH0kAgAADedCAAAY/gIAAEOMw
Date:   Mon, 2 Dec 2019 14:44:43 +0000
Message-ID: <AM5PR1001MB0994B8FDCC3C1B991433344780430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191128171931.22563-1-m.felsch@pengutronix.de>
 <AM5PR1001MB09946EB98C8119345472BDB380430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191202105646.xzqzlu2jnel4qbuv@pengutronix.de>
 <AM5PR1001MB0994B329C5D4B8846FC7A71880430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191202130314.dzne7eh2b5sb46c2@pengutronix.de>
 <AM5PR1001MB099461A4E8253F74FC11D6E480430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <1feb2b8e-af46-ffa9-873a-fd9b624294b9@roeck-us.net>
In-Reply-To: <1feb2b8e-af46-ffa9-873a-fd9b624294b9@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5c5cd6b-e270-4680-9462-08d777362b9a
x-ms-traffictypediagnostic: AM5PR1001MB1028:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB1028E8E3352B87C2CFAB8C13A7430@AM5PR1001MB1028.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(366004)(376002)(346002)(39850400004)(136003)(199004)(189003)(55016002)(7736002)(305945005)(3846002)(71190400001)(6116002)(9686003)(14454004)(4326008)(25786009)(71200400001)(8676002)(6246003)(74316002)(81156014)(81166006)(5660300002)(8936002)(33656002)(229853002)(316002)(110136005)(14444005)(256004)(86362001)(66066001)(52536014)(478600001)(99286004)(2906002)(76176011)(53546011)(66556008)(66476007)(7696005)(102836004)(55236004)(76116006)(186003)(64756008)(6436002)(26005)(6506007)(66946007)(11346002)(446003)(66446008)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1028;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /M4oA+7ID8bj8WSmUnpnsg9C46d+tOI/aUV3n1onekCIJvglEBhPMc2EiuOlsAM477JneQhcTmLAwewQcCEZVr5NxJRL5osAoqRlOkV+nco5WjAczMSXbTgSfURgzgd/cxRVxu4SZhtI0mhKpdl0o9dLjjraOcznQK0mIXZBVFATDEralJKKdqoAOipGGpHkAqpn1hWIK4unB9ETnfRlSEXcr49bA5fTPXQQLYnAxOzfMJNUpmTPcHJw//aUpOtpwR59i8L5dV+lFfsodLb5jSB+dtl7yum39tLbZfgNOx94WKjJgs0N1007BPvVTSin/sww1Gjx/VsEV+jUTbD0HZrfm0HtiSXeQjCeHKoyEA4WAWsVj2POm7gYkLnkJg900B1T5pzap3yiSCo4BE9roygzlhKtOFqjMM2Y6XXqDP4lQwy2rbUxFHYrnlldzJ4F
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c5cd6b-e270-4680-9462-08d777362b9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 14:44:43.8495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SklRxcaCkX5zBiOHRzeKDYWXC1CUwnUTDENlrOeAEFgBH4JWIBD6Ssvdv1AGlArx35LD9LP9Gyr5JC14At0Iwjg1IcUy1uAzYyrCBhvQzaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1028
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gMDIgRGVjZW1iZXIgMjAxOSAxMzozOCwgQWRhbSBUaG9tc29uIHdyb3RlOg0KDQo+IE9uIDEy
LzIvMTkgNToyNyBBTSwgQWRhbSBUaG9tc29uIHdyb3RlOg0KPiA+IEhpIE1hcmNvLA0KPiA+DQo+
ID4+PiBIbW1tLiBXb3VsZG4ndCB0aGF0IHRoZW4gYmUgYSBib2FyZCBzcGVjaWZpYyBmaXggcmF0
aGVyIHRoYW4gdGhpcyBjaGFuZ2U/DQo+ID4+PiBBbSBjb25jZXJuZWQgcmVseWluZyBvbiBzb2Z0
d2FyZSB0byByZWVuYWJsZSB0aGUgd2F0Y2hkb2cgb24gcmVzdW1lDQo+IGNvdWxkDQo+ID4+IGFs
bG93DQo+ID4+PiBmb3IgYSBoYW5nIHNjZW5hcmlvIHBvdGVudGlhbGx5IGlmIHRoYXQgY29kZSBu
ZXZlciBnZXRzIHRvIGV4ZWN1dGUuIE90aGVyDQo+ID4+PiBzeXN0ZW1zIHNob3VsZG4ndCBuZWVk
IHRoaXMgZml4LCBhc3N1bWluZyB0aGV5IGRvbid0IGhhdmUgaXNzdWVzIGF0IHRoZSBIVw0KPiA+
Pj4gbGV2ZWwsIHNvIHRoaXMgdGhpcyBzZWVtcyBsaWtlIGl0IGNvdWxkIGJlIG1ha2luZyB0aG9z
ZSBzeXN0ZW1zIGxlc3Mgcm9idXN0LiBJZg0KPiA+Pj4gd2UgYXJlIHRvIGRvIHRoaXMgYXQgdGhl
IGRyaXZlciBsZXZlbCwgbWF5YmUgdGhpcyBzaG91bGQgYmUgYW4gb3B0aW9uIHRocm91Z2gNCj4g
RFQNCj4gPj4+IHRvIGhlbHAgZmF1bHR5IHN5c3RlbXMsIGJ1dCBJJ20gdGhpbmtpbmcgdGhpcyBz
aG91bGRuJ3QgYmUgZGVmYXVsdCBiZWhhdmlvdXIuDQo+ID4+DQo+ID4+IEkgZG9uJ3QgdGhpbmsg
dGhhdCB3ZSBzaG91bGQgcmVseSBvbiB0aGUgT1RQIHZhbHVlcy4gVGhvc2UgdmFsdWVzIGFyZQ0K
PiA+PiBzZXQgYnkgRGlhbG9nLCB0aGUgU29NIG1hbnVmYWN0dXJlcnMgb3IgYnkgdGhlIGN1c3Rv
bWVyIGl0c2VsZiBhbmQgdGhlDQo+ID4+IHRpbWUgc2hvd3MgdGhhdCB0aGlzIGlzIGVycm9yIHBy
b25lIHRvby4gQXQgbGVhc3QgaWYgdGhlIGN1c3RvbWVyIG9yIHRoZQ0KPiA+PiBTb00gbWFudWZh
Y3R1cmVyIGRvbid0IGFzayB0aGUgRGlhbG9nIFN1cHBvcnQuLg0KPiA+Pg0KPiA+PiBZb3UncmUg
cmlnaHQgd2l0aCB0aGUgKHJlLSllbmFibGluZyBidXQgdGhlcmUgYXJlIG90aGVyIGRyaXZlcnMg
dXNpbmcNCj4gPj4gc3VjaCBhbiBhcHByb2FjaC4uIElNSE8gaXQgaXMgc2FmZXIgdG8gZ28gdGhp
cyB3YXkgcmF0aGVyIHRoYW4gdHJ1c3QNCj4gPj4gdGhlIE9UUCBhbmQgdGhlIFBDQiBsYXlvdXQu
IEkgd291bGQgcmF0aGVyIGFkZCBhIGR0LWNvbXBhdGlibGUgdG8gdGVsbA0KPiA+PiB0aGUgZHJp
dmVyIHRvIGRvIG5vdGhpbmcgZHVyaW5nIHN1c3BlbmQvcmVzdW1lIGUuZy46DQo+ID4+DQo+ID4+
ICAgICAgLSBkbGcsdXNlLWh3LXBtDQo+ID4+DQo+ID4+IG9yIHNvbWV0aGluZy4gQmVjYXVzZSB0
aGUgdXNlciBuZWVkcyB0byB2YWxpZGF0ZSB0aGUgUENCIGFuZCB0aGUgT1RQDQo+ID4+IHZhbHVl
cy4NCj4gPg0KPiA+IFRoZSB0aGluZyBpcyB0aGUgRFQgRlcgaXMgc3VwcG9zZWQgdG8gYmUgZmFp
cmx5IHN0YXRpYyBzbyBJIHdvdWxkIHJhdGhlciBub3QNCj4gPiBlbmZvcmNlIHRoaXMgY2hhbmdl
IG9uIHVzZXJzIGlmIHRoZXkgYWRvcHQgYSBrZXJuZWwgdmVyc2lvbiB3aXRoIHRoaXMgdXBkYXRl
IGluLg0KPiA+IEkgYWxzbyBzdGlsbCB0aGluayBpdCdzIHNhZmVyIGlmIHRoZSBIVyBkb2VzIHRo
aXMgZm9yIHVzLiBJIHdvdWxkIGhhdmUgaG9wZWQgZm9yDQo+ID4gbW9zdCBkZXNpZ25zIHRoaXMg
d291bGQgYmUgY2F1Z2h0IGluIGVhcmx5IGJyaW5nIHVwIHdoZXJlIGl0IGNhbiBiZSByZWN0aWZp
ZWQNCj4gPiB3aXRoIG1pbmltYWwgaW1wYWN0LCBhbHRob3VnaCBJJ20gZ3Vlc3NpbmcgdGhhdCdz
IG5vdCB0aGUgY2FzZSBpbiB5b3VyIHNjZW5hcmlvLg0KPiA+DQo+IA0KPiBkbGEsdXNlLXN3LXBt
ID8NCj4gZGxhLGh3LXBtLWJyb2tlbiA/DQoNClllcywgSSdkIHByb2JhYmx5IG9wdCBmb3IgJ2Rs
Zyx1c2Utc3ctcG0nIG9yIG1heWJlICdkbGcsbWFudWFsLXBtJyB0byBjb3ZlciBpdC4NCg0KPiAN
Cj4gR3VlbnRlcg0K
