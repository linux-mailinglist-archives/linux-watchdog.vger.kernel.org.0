Return-Path: <linux-watchdog+bounces-2574-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A5F9F20EC
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 Dec 2024 22:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED48816509E
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 Dec 2024 21:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9401A8F79;
	Sat, 14 Dec 2024 21:22:15 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA00313AA2A
	for <linux-watchdog@vger.kernel.org>; Sat, 14 Dec 2024 21:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.85.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734211335; cv=none; b=CR7K8SLI9H5BL/4g+2BX68IPwnm1rrK4Qs5cXWEiMcnI+5e/dGFUkuJPJ1kJpQ2kQip0B6so9z9dd1/BxMeYKig+esjvtMpP0qr2WnOb7JGRrcTtMCTTwe53rYPhjnJetjX/8Eq7qRNNBN0tRgY61P+iqMvf+YVZ937WImtHiQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734211335; c=relaxed/simple;
	bh=8GG0RjcNGNE2OK3lCVeZBPxKNfW8B/oXmAkc+WuOPYA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=AQ4JTdgvDIAxZEfTjBKFktHTPT0Wh7p8OVHIjTZR/xUJWM8INjXr4PrSSXU8lUTrY+FeWEIVRiaY9cwS+/eFI2ui2vY5n/sRlbgIjmOX+7kbQKMQaDA/Uwt2G3MMvrQ4hu7CJ3r/tqY8gZsjWUEXwWr3FT3yLylcsu3oAp8Byt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.85.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-58-sktCOR70PYGp0bebtytxiw-1; Sat, 14 Dec 2024 21:22:09 +0000
X-MC-Unique: sktCOR70PYGp0bebtytxiw-1
X-Mimecast-MFC-AGG-ID: sktCOR70PYGp0bebtytxiw
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 14 Dec
 2024 21:21:12 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 14 Dec 2024 21:21:12 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Guenter Roeck' <linux@roeck-us.net>, Phil Eichinger <phil@zankapfel.net>,
	"wim@linux-watchdog.org" <wim@linux-watchdog.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] watchdog: aspeed: replace mdelay with msleep
Thread-Topic: [PATCH] watchdog: aspeed: replace mdelay with msleep
Thread-Index: AQHbTJ2DHVjYGoChYUCL8UX75YmbgrLmQtrQ
Date: Sat, 14 Dec 2024 21:21:12 +0000
Message-ID: <d7ab80332def4a328cb9492fddcb8bef@AcuMS.aculab.com>
References: <20241212113014.1075414-1-phil@zankapfel.net>
 <3fe75eab-e700-4ae2-984b-42342ec7d784@roeck-us.net>
In-Reply-To: <3fe75eab-e700-4ae2-984b-42342ec7d784@roeck-us.net>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8WpbwE8JfnWuH0_Ym4Nru-qQb1fwHtPiz_JYGwp5y3I_1734211329
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbTogR3VlbnRlciBSb2Vjaw0KPiBTZW50OiAxMiBEZWNlbWJlciAyMDI0IDEzOjU2DQo+IFRv
OiBQaGlsIEVpY2hpbmdlciA8cGhpbEB6YW5rYXBmZWwubmV0Pjsgd2ltQGxpbnV4LXdhdGNoZG9n
Lm9yZzsgam9lbEBqbXMuaWQuYXU7DQo+IGFuZHJld0Bjb2RlY29uc3RydWN0LmNvbS5hdTsgbGlu
dXgtd2F0Y2hkb2dAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmc7DQo+IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnOyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHdhdGNoZG9nOiBhc3BlZWQ6
IHJlcGxhY2UgbWRlbGF5IHdpdGggbXNsZWVwDQo+IA0KPiBPbiAxMi8xMi8yNCAwMzozMCwgUGhp
bCBFaWNoaW5nZXIgd3JvdGU6DQo+ID4gU2luY2UgaXQgaXMgbm90IGNhbGxlZCBpbiBhbiBhdG9t
aWMgY29udGV4dCB0aGUgbWRlbGF5IGZ1bmN0aW9uDQo+ID4gY2FuIGJlIHJlcGxhY2VkIHdpdGgg
bXNsZWVwIHRvIGF2b2lkIGJ1c3kgd2FpdC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBoaWwg
RWljaGluZ2VyIDxwaGlsQHphbmthcGZlbC5uZXQ+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL3dh
dGNoZG9nL2FzcGVlZF93ZHQuYyB8IDIgKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0
Y2hkb2cvYXNwZWVkX3dkdC5jIGIvZHJpdmVycy93YXRjaGRvZy9hc3BlZWRfd2R0LmMNCj4gPiBp
bmRleCBiNDc3M2E2YWFmOGMuLjk4ZWYzNDE0MDhmNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L3dhdGNoZG9nL2FzcGVlZF93ZHQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvYXNwZWVk
X3dkdC5jDQo+ID4gQEAgLTIwOCw3ICsyMDgsNyBAQCBzdGF0aWMgaW50IGFzcGVlZF93ZHRfcmVz
dGFydChzdHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZGQsDQo+ID4gICAJd2R0LT5jdHJsICY9IH5X
RFRfQ1RSTF9CT09UX1NFQ09OREFSWTsNCj4gPiAgIAlhc3BlZWRfd2R0X2VuYWJsZSh3ZHQsIDEy
OCAqIFdEVF9SQVRFXzFNSFogLyAxMDAwKTsNCj4gPg0KPiA+IC0JbWRlbGF5KDEwMDApOw0KPiA+
ICsJbXNsZWVwKDEwMDApOw0KPiA+DQo+ID4gICAJcmV0dXJuIDA7DQo+ID4gICB9DQo+IFRoaXMg
aXMgYSBfcmVzdGFydF8gaGFuZGxlci4gVGhlIG9ubHkgcHVycG9zZSBvZiB0aGUgZGVsYXkgaXMg
dG8gd2FpdA0KPiBmb3IgdGhlIHJlc2V0IHRvIHRyaWdnZXIuIEl0IGlzIG5vdCBzdXBwb3NlZCB0
byBzbGVlcC4NCg0KV2l0aCB0aGUgcmVjZW50IHNjaGVkdWxlciBjaGFuZ2VzIGlzbid0IHRoZSBj
b2RlIGxpa2VseSB0byBnZXQNCnByZS1lbXB0ZWQ/DQpXaGljaCAoZWZmZWN0aXZlbHkpIGNvbnZl
cnRzIGlzIHRvIGEgc2xlZXA/DQoNCglEYXZpZA0KIA0KPiANCj4gTkFDSy4NCj4gDQo+IEd1ZW50
ZXINCj4gDQo+IA0KPiANCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5
IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRp
b24gTm86IDEzOTczODYgKFdhbGVzKQ0K


