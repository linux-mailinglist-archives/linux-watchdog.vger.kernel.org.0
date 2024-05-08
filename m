Return-Path: <linux-watchdog+bounces-1053-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 779038C05B9
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 May 2024 22:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C41D4B22FC7
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 May 2024 20:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29378130ADF;
	Wed,  8 May 2024 20:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PlAeuwJZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EE112A17F;
	Wed,  8 May 2024 20:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715200361; cv=none; b=tGH8lEYukhBRNXGulQxW2L3lWq+5HTu9onnZMaOtJZVAzQdXLrJ1GhUDlVKgoZ9bt5+hsU1uhlUIZvkjRHrpy4nCaFTR3oaoL/1MGQ8wXUEbnz/MwtMDDhU9GLW/dk2z86rVXzQdOFqY3WR4RhwP+3J289S7pR5oApf47+CZYaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715200361; c=relaxed/simple;
	bh=aNUzZ2COsK+rLtx48ZbkkjJWdrLlmJNoOvt7NilvMV8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hDViAlNamMVqXZuX1wRTN2TJV3Oim/4SBLR/RU6kVR4vvVWr44rXpqQeEG+ptHFdtzRp85PCby23ydjqkulXRBLPDWjhuGXQOr+t4j2RQB5y1vaOsnxtO8w2ZqCA+dK/eI8XwEeuPJYTqCwh8XKdw9EnuUph/PHDUqt3Ls+RyWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PlAeuwJZ; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 448KWKnP016959;
	Wed, 8 May 2024 15:32:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715200340;
	bh=aNUzZ2COsK+rLtx48ZbkkjJWdrLlmJNoOvt7NilvMV8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=PlAeuwJZKxGrNGObZatsTJjj+Cpz/Mzopi5CAWReFEC8H6jqmMZuGCgaOCYolWVzS
	 CC6v3kgopMaT0ZeqSGIyuoARTtMmFc/mj78HkPrqQUVBls/bA6CZNaJ6cjtifs8M6A
	 r0AD6//oVu433DValca3DinVnqqI/nCRMsvxGdNc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 448KWKWd018639
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 May 2024 15:32:20 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 May 2024 15:32:20 -0500
Received: from DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4]) by
 DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4%18]) with mapi id
 15.01.2507.023; Wed, 8 May 2024 15:32:20 -0500
From: "Saulnier, Nick" <nsaulnier@ti.com>
To: "Mendez, Judith" <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rafael Beims
	<rafael.beims@toradex.com>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>
Subject: RE: [PATCH v3] watchdog: rti_wdt: Set min_hw_heartbeat_ms to
 accommodate a safety margin
Thread-Topic: [PATCH v3] watchdog: rti_wdt: Set min_hw_heartbeat_ms to
 accommodate a safety margin
Thread-Index: AQHakQnLlxrZoPojOkaK7xuKhSVoY7GOIuiA//+0TZA=
Date: Wed, 8 May 2024 20:32:20 +0000
Message-ID: <be00c7622f80474bbe4a9cffc16e3025@ti.com>
References: <20240417205700.3947408-1-jm@ti.com>
 <a523cf49-4eeb-44a2-8438-c77b3c50ad15@ti.com>
In-Reply-To: <a523cf49-4eeb-44a2-8438-c77b3c50ad15@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

VGVzdGVkIG9uIG15IHNpZGUgd2l0aCB0aGUgZGVmYXVsdCA1MCUgd2luZG93IGFjcm9zcyBhIHJh
bmdlIG9mIHBlcmlvZHMuIFdvcmtzIGFzIGV4cGVjdGVkLiBEZXRhaWxzIGF0IA0KaHR0cHM6Ly9l
MmUudGkuY29tL3N1cHBvcnQvcHJvY2Vzc29ycy1ncm91cC9wcm9jZXNzb3JzL2YvcHJvY2Vzc29y
cy1mb3J1bS8xMzM4MDcwL2FtNjI1LWhvdy10by1jb250cm9sLXRoZS13YXRjaGRvZy81MTY2MDMy
IzUxNjYwMzIgDQoNClJlZ2FyZHMsDQpOaWNrIFNhdWxuaWVyDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBNZW5kZXosIEp1ZGl0aCANClNlbnQ6IFdlZG5lc2RheSwgTWF5IDA4
LCAyMDI0IDE6NTAgUE0NClRvOiBXaW0gVmFuIFNlYnJvZWNrIDx3aW1AbGludXgtd2F0Y2hkb2cu
b3JnPjsgR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pg0KQ2M6IGxpbnV4LXdhdGNo
ZG9nQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgUmFmYWVs
IEJlaW1zIDxyYWZhZWwuYmVpbXNAdG9yYWRleC5jb20+OyBSYWdoYXZlbmRyYSwgVmlnbmVzaCA8
dmlnbmVzaHJAdGkuY29tPjsgU2F1bG5pZXIsIE5pY2sgPG5zYXVsbmllckB0aS5jb20+DQpTdWJq
ZWN0OiBSZTogW1BBVENIIHYzXSB3YXRjaGRvZzogcnRpX3dkdDogU2V0IG1pbl9od19oZWFydGJl
YXRfbXMgdG8gYWNjb21tb2RhdGUgYSBzYWZldHkgbWFyZ2luDQoNCkhpIGFsbCwNCg0KT24gNC8x
Ny8yNCAzOjU3IFBNLCBKdWRpdGggTWVuZGV6IHdyb3RlOg0KPiBPbiBBTTYyeCwgdGhlIHdhdGNo
ZG9nIGlzIHBldCBiZWZvcmUgdGhlIHZhbGlkIHdpbmRvdyBpcyBvcGVuLiBGaXggDQo+IG1pbl9o
d19oZWFydGJlYXQgYW5kIGFjY29tbW9kYXRlIGEgMiUgKyBzdGF0aWMgb2Zmc2V0IHNhZmV0eSBt
YXJnaW4uDQo+IFRoZSBzdGF0aWMgb2Zmc2V0IGFjY291bnRzIGZvciBtYXggaGFyZHdhcmUgZXJy
b3IuDQo+IA0KPiBSZW1vdmUgdGhlIGhhY2sgaW4gdGhlIGRyaXZlciB3aGljaCBzaGlmdHMgdGhl
IG9wZW4gd2luZG93IGJvdW5kYXJ5LCANCj4gc2luY2UgaXQgaXMgbm8gbG9uZ2VyIG5lY2Vzc2Fy
eSBkdWUgdG8gdGhlIGZpeCBtZW50aW9uZWQgYWJvdmUuDQo+IA0KDQpUaGlzIHBhdGNoIGhhcyBi
ZWVuIHNpdHRpbmcgYW5kIHRoZXJlIGFyZSBubyBjb21tZW50cy4NClBsZWFzZSBsZXQgbWUga25v
dyBpZiB0aGVyZSBpcyBhbnkgaXNzdWUgd2l0aCB0aGlzIHBhdGNoLCBzaW5jZSBJIHdvdWxkIGxp
a2UgdG8gZ2V0IHRoaXMgZml4IG1lcmdlZCAoOg0KDQpUaGFua3MsDQpKdWRpdGgNCg0K

