Return-Path: <linux-watchdog+bounces-2795-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A93DA1D389
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 Jan 2025 10:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6760A16203C
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 Jan 2025 09:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377811FCFE6;
	Mon, 27 Jan 2025 09:35:59 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8783E28E7;
	Mon, 27 Jan 2025 09:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737970559; cv=none; b=HqqIH/l/a1Gm/X0ZdkpBIv5KNmcgnWTCvwIR2mJILI0h693/wduHL8dpP3Qn49i7S6IzdMno8rYa/NjOG3Nz0hOsWpPwlta8AgiC2JsqKvzDkgM7aoz4CbPj3S/Pbo+rlDnYOJcKEqkkbgkEeaQiaW71RXhTjiTItrCv9NMq0r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737970559; c=relaxed/simple;
	bh=6jkqoHa17+qk1wR9ezelE7UMBJlJ0VHyzGgrYduSnmc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=e91oxVWnNDWyQ7Ls6JR2OziqR3Py4GD5m88wLq7sNJLaasRpEV3VEMQhcrK3ycUUJ3v0bpiJujbhz2UL2Z4psIQyzgkZjU8Q6UFYqWXvZTfAg8fJz0JBlxFWI60Bx6POJmMsEJjtUSzip4YYgucwt8UoQq1wH2KE1D9TPUieo28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YhNWW5JMYz22m0P;
	Mon, 27 Jan 2025 17:33:11 +0800 (CST)
Received: from kwepemk500012.china.huawei.com (unknown [7.202.194.97])
	by mail.maildlp.com (Postfix) with ESMTPS id 422A6180042;
	Mon, 27 Jan 2025 17:35:47 +0800 (CST)
Received: from kwepemk100005.china.huawei.com (7.202.194.53) by
 kwepemk500012.china.huawei.com (7.202.194.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 27 Jan 2025 17:35:46 +0800
Received: from kwepemk100005.china.huawei.com ([7.202.194.53]) by
 kwepemk100005.china.huawei.com ([7.202.194.53]) with mapi id 15.02.1544.011;
 Mon, 27 Jan 2025 17:35:46 +0800
From: "liuchao (CR)" <liuchao173@huawei.com>
To: Guenter Roeck <linux@roeck-us.net>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: caihe <caihe@huawei.com>, lixiaokeng <lixiaokeng@huawei.com>
Subject: RE: RE: [PATCH] watchdog: only print critical log when the watchdog
 fails to be stopped
Thread-Topic: RE: [PATCH] watchdog: only print critical log when the watchdog
 fails to be stopped
Thread-Index: Adtwnr9oWcKwtewnRXiSaLrYeWdegg==
Date: Mon, 27 Jan 2025 09:35:46 +0000
Message-ID: <09237774d7a64521888fdd47f4ac5d8e@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gMS8yNi8yNSAyMToxMCwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4gT24gMS8yNi8yNSAwMDoz
OCwgTGl1IENoYW8gd3JvdGU6DQo+ID4gRXZlcnkgdGltZSB0aGUgdXNlciBlY2hvZXMgMCA+IC9k
ZXYvd2F0Y2hkb2cwLCBtZWFuaW5nbGVzcyBjcml0aWNhbA0KPiA+IGxvZyBpcyBwcmludGVkLg0K
PiA+DQo+IA0KPiBJdCBpcyBub3QgbWVhbmluZ2xlc3MsIGFuZCBpdCB3aWxsIHN0aWxsIGJlIGRp
c3BsYXllZCBhZnRlciB0aGlzIGNoYW5nZSwgbWFraW5nIHRoZQ0KPiBjaGFuZ2UgcG9pbnRsZXNz
Lg0KDQpUaGUgY2hhbmdlIGlzIG5vdCBwb2ludGxlc3MuIEZvciBleGFtcGxlLCB0aGUgc29mdGRv
ZyBkcml2ZXIgZG9lcyBub3QgaW52b2tlIA0Kd2F0Y2hkb2dfc3RvcCBvciBwcmludCBsb2dzIGlu
IHRoZSB3YXRjaGRvZ19yZWxlYXNlLg0KDQpMaXUgQ2hhbw0KDQo+IA0KPiBHdWVudGVyDQo+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IExpdSBDaGFvIDxsaXVjaGFvMTczQGh1YXdlaS5jb20+DQo+ID4g
LS0tDQo+ID4gICBkcml2ZXJzL3dhdGNoZG9nL3dhdGNoZG9nX2Rldi5jIHwgOSArKysrKy0tLS0N
Cj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy93YXRjaGRvZ19kZXYuYw0KPiA+
IGIvZHJpdmVycy93YXRjaGRvZy93YXRjaGRvZ19kZXYuYyBpbmRleCBlMmJkMjY2YjFiNWIuLjBh
OWQ1ZTZmM2E4OA0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvd2F0Y2hk
b2dfZGV2LmMNCj4gPiArKysgYi9kcml2ZXJzL3dhdGNoZG9nL3dhdGNoZG9nX2Rldi5jDQo+ID4g
QEAgLTk2MCwxNCArOTYwLDE1IEBAIHN0YXRpYyBpbnQgd2F0Y2hkb2dfcmVsZWFzZShzdHJ1Y3Qg
aW5vZGUgKmlub2RlLA0KPiBzdHJ1Y3QgZmlsZSAqZmlsZSkNCj4gPiAgIAlpZiAoIXdhdGNoZG9n
X2FjdGl2ZSh3ZGQpKQ0KPiA+ICAgCQllcnIgPSAwOw0KPiA+ICAgCWVsc2UgaWYgKHRlc3RfYW5k
X2NsZWFyX2JpdChfV0RPR19BTExPV19SRUxFQVNFLA0KPiAmd2RfZGF0YS0+c3RhdHVzKSB8fA0K
PiA+IC0JCSAhKHdkZC0+aW5mby0+b3B0aW9ucyAmIFdESU9GX01BR0lDQ0xPU0UpKQ0KPiA+ICsJ
CSAhKHdkZC0+aW5mby0+b3B0aW9ucyAmIFdESU9GX01BR0lDQ0xPU0UpKSB7DQo+ID4gICAJCWVy
ciA9IHdhdGNoZG9nX3N0b3Aod2RkKTsNCj4gPiArCQlpZiAoZXJyIDwgMCkNCj4gPiArCQkJcHJf
Y3JpdCgid2F0Y2hkb2clZDogd2F0Y2hkb2cgZGlkIG5vdCBzdG9wIVxuIiwgd2RkLT5pZCk7DQo+
ID4gKwl9DQo+ID4NCj4gPiAgIAkvKiBJZiB0aGUgd2F0Y2hkb2cgd2FzIG5vdCBzdG9wcGVkLCBz
ZW5kIGEga2VlcGFsaXZlIHBpbmcgKi8NCj4gPiAtCWlmIChlcnIgPCAwKSB7DQo+ID4gLQkJcHJf
Y3JpdCgid2F0Y2hkb2clZDogd2F0Y2hkb2cgZGlkIG5vdCBzdG9wIVxuIiwgd2RkLT5pZCk7DQo+
ID4gKwlpZiAoZXJyIDwgMCkNCj4gPiAgIAkJd2F0Y2hkb2dfcGluZyh3ZGQpOw0KPiA+IC0JfQ0K
PiA+DQo+ID4gICAJd2F0Y2hkb2dfdXBkYXRlX3dvcmtlcih3ZGQpOw0KPiA+DQoNCg==

