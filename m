Return-Path: <linux-watchdog+bounces-2672-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B04AA0AE12
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 04:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51E003A59A0
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 03:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE141487C1;
	Mon, 13 Jan 2025 03:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="i32yi60d"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260F71474D3;
	Mon, 13 Jan 2025 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736740752; cv=none; b=Fesf/GxJeKjSkJlFu8Yse1vHzmIsr8/FpMBz9cATxJq98Y9XmoCvt30HdybtODP9KpsDwF8mW2CcVdggr/1jabpBzBOq8fG+gMZvAW/wzTOoPlW9RcWcXyuSyds9C0l8itHGcuqILptxYzPPkbUI1IQYZPSts/1Y07U2+5L/+aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736740752; c=relaxed/simple;
	bh=QLhw6OkQrXv0RsZWIWSuSjwbKLs0+8UzD3LS2CDT3yw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BvphrryoSOlLVpxzrBxB5ZuW4H/tDU9NlbXINFw82ilZas+8OA3RK+l/gNqDCniWNiEz99qvmm6QVTOe80+BLZksK19HwCFR9MjERLzrcmDwR2/GERHZ4+x3HQZ0WEE7s+7ELEorhfg32ARiZiU5e6yzrUaXz/diqPuEiQWCZ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=i32yi60d; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1736740746;
	bh=QLhw6OkQrXv0RsZWIWSuSjwbKLs0+8UzD3LS2CDT3yw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=i32yi60doVevtEVYaXyWyCzZ7KCFtnSOqmAQcK5OPyn3ilaXE3ZCMgRaii+HwbyW1
	 Fujc2vB6QpFtMP95uHadSHEwEWzQ70g8UK+JyEPHRDhHwQLsec36Oy5qiBbei3efTv
	 6GVevKhTm078Zy1A4+yKntwq/MjE1xomYpw7ghbsCiVYpdlcx/Hc+vZ5BemlCZyEQk
	 L8OlM1vI5Bl9YSOMhNMrS2e+AuQVijcMbMGvQMMAmgfUFj59JjWgPR3nbWmHAAVGOZ
	 fnHCXuDLIQOhJ9IxB+wwfPJ6JDBpDaC6rfAs3HtNIDngYU99CGG0c0oajoPZkOx24I
	 ebhE8eBQ//Xqg==
Received: from [192.168.68.112] (ppp118-210-178-153.adl-adc-lon-bras34.tpg.internode.on.net [118.210.178.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9403D7178A;
	Mon, 13 Jan 2025 11:59:05 +0800 (AWST)
Message-ID: <277cdf8cd94e61d3c28e03c6bf929c86b52df120.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 1/1] watchdog: aspeed: Update bootstatus handling
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, "patrick@stwcx.xyz"
	 <patrick@stwcx.xyz>, "linux@roeck-us.net" <linux@roeck-us.net>, 
	"wim@linux-watchdog.org"
	 <wim@linux-watchdog.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"linux-watchdog@vger.kernel.org"
	 <linux-watchdog@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Cc: "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>, 
	"Patrick_NC_Lin@wiwynn.com"
	 <Patrick_NC_Lin@wiwynn.com>, BMC-SW <BMC-SW@aspeedtech.com>, 
	"chnguyen@amperecomputing.com"
	 <chnguyen@amperecomputing.com>, Aaron Lee <aaron_lee@aspeedtech.com>
Date: Mon, 13 Jan 2025 14:29:04 +1030
In-Reply-To: <TYZPR06MB52032C46C1AB2C18B923A8E6B21F2@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20250112081204.263216-1-chin-ting_kuo@aspeedtech.com>
	 <20250112081204.263216-2-chin-ting_kuo@aspeedtech.com>
	 <b4fa429c6c7df899281d36f295b4431c90fe443c.camel@codeconstruct.com.au>
	 <TYZPR06MB52032C46C1AB2C18B923A8E6B21F2@TYZPR06MB5203.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gTW9uLCAyMDI1LTAxLTEzIGF0IDAzOjQxICswMDAwLCBDaGluLVRpbmcgS3VvIHdyb3RlOgo+
IEhpIEFuZHJldywKPiAKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBB
bmRyZXcgSmVmZmVyeSA8YW5kcmV3QGNvZGVjb25zdHJ1Y3QuY29tLmF1Pgo+ID4gU2VudDogTW9u
ZGF5LCBKYW51YXJ5IDEzLCAyMDI1IDExOjI5IEFNCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2
IDEvMV0gd2F0Y2hkb2c6IGFzcGVlZDogVXBkYXRlIGJvb3RzdGF0dXMKPiA+IGhhbmRsaW5nCj4g
PiAKPiA+IE9uIFN1biwgMjAyNS0wMS0xMiBhdCAxNjoxMiArMDgwMCwgQ2hpbi1UaW5nIEt1byB3
cm90ZToKPiA+ID4gVGhlIGJvb3Qgc3RhdHVzIGluIHRoZSB3YXRjaGRvZyBkZXZpY2Ugc3RydWN0
IGlzIHVwZGF0ZWQgZHVyaW5nCj4gPiA+IGNvbnRyb2xsZXIgcHJvYmUgc3RhZ2UuIEFwcGxpY2F0
aW9uIGxheWVyIGNhbiBnZXQgdGhlIGJvb3Qgc3RhdHVzCj4gPiA+IHRocm91Z2ggdGhlIGNvbW1h
bmQsIGNhdAo+ID4gPiAvc3lzL2NsYXNzL3dhdGNoZG9nL3dhdGNoZG9nWC9ib290c3RhdHVzLgo+
ID4gPiBUaGUgYm9vdHN0YXR1cyBjYW4gYmUsCj4gPiA+IFdESU9GX0NBUkRSRVNFVCA9PiB0aGUg
c3lzdGVtIGlzIHJlc2V0IGJ5IFdEVCBTb0MgcmVzZXQuCj4gPiA+IE90aGVyc8KgwqDCoMKgwqDC
oMKgwqDCoCA9PiBvdGhlciByZXNldCBldmVudHMsIGUuZy4sIHBvd2VyIG9uIHJlc2V0Lgo+ID4g
PiAKPiA+ID4gT24gQVNQRUVEIHBsYXRmb3JtLCB0aGUgYm9vdCBzdGF0dXMgaXMgcmVjb3JkZWQg
aW4gdGhlIFNDVQo+ID4gPiByZWdpc3RlcnMuCj4gPiA+IC0gQVNUMjQwMDogT25seSBhIGJpdCBy
ZXByZXNlbnRzIGZvciBhbnkgV0RUIHJlc2V0Lgo+ID4gPiAtIEFTVDI1MDAvQVNUMjYwMDogVGhl
IHJlc2V0IHRyaWdnZXJlZCBieSBkaWZmZXJlbnQgV0RUCj4gPiA+IGNvbnRyb2xsZXJzCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYW4gYmUgZGlzdGluZ3Vpc2hl
ZCBieSBkaWZmZXJlbnQgU0NVIGJpdHMuCj4gPiA+IAo+ID4gPiBCZXNpZGVzLCBvbiBBU1QyNDAw
IGFuZCBBU1QyNTAwLCBzaW5jZSBhbHRlcm5hdGluZyBib290IGV2ZW50IGlzCj4gPiA+IHRyaWdn
ZXJlZCBieSBXRFQgU29DIHJlc2V0LCBpdCBpcyBjbGFzc2lmaWVkIGFzIFdESU9GX0NBUkRSRVNF
VC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IENoaW4tVGluZyBLdW8gPGNoaW4tdGluZ19r
dW9AYXNwZWVkdGVjaC5jb20+Cj4gPiA+IC0tLQo+ID4gPiDCoGRyaXZlcnMvd2F0Y2hkb2cvYXNw
ZWVkX3dkdC5jIHwgODEKPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0K
PiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNzkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL2FzcGVlZF93ZHQuYwo+
ID4gPiBiL2RyaXZlcnMvd2F0Y2hkb2cvYXNwZWVkX3dkdC5jIGluZGV4IGI0NzczYTZhYWY4Yy4u
MzY5NjM1YjM4Y2EwCj4gPiA+IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL2Fz
cGVlZF93ZHQuYwo+ID4gPiArKysgYi9kcml2ZXJzL3dhdGNoZG9nL2FzcGVlZF93ZHQuYwo+ID4g
PiBAQCAtMTEsMjEgKzExLDMwIEBACj4gPiA+IMKgI2luY2x1ZGUgPGxpbnV4L2lvLmg+Cj4gPiA+
IMKgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ID4gPiDCoCNpbmNsdWRlIDxsaW51eC9rc3Ry
dG94Lmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvbWZkL3N5c2Nvbi5oPgo+ID4gPiDCoCNpbmNs
dWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+ID4gwqAjaW5jbHVkZSA8bGludXgvb2YuaD4KPiA+ID4g
wqAjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+Cj4gPiA+IMKgI2luY2x1ZGUgPGxpbnV4L3BsYXRm
b3JtX2RldmljZS5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgo+ID4gPiDCoCNp
bmNsdWRlIDxsaW51eC93YXRjaGRvZy5oPgo+ID4gPiAKPiA+ID4gwqBzdGF0aWMgYm9vbCBub3dh
eW91dCA9IFdBVENIRE9HX05PV0FZT1VUOwo+ID4gPiDCoG1vZHVsZV9wYXJhbShub3dheW91dCwg
Ym9vbCwgMCk7Cj4gPiA+IMKgTU9EVUxFX1BBUk1fREVTQyhub3dheW91dCwgIldhdGNoZG9nIGNh
bm5vdCBiZSBzdG9wcGVkIG9uY2UKPiA+IHN0YXJ0ZWQKPiA+ID4gKGRlZmF1bHQ9Igo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgX19NT0RVTEVfU1RSSU5HKFdBVEMKPiA+IEhET0dfTk9XQVlPVVQpCj4gPiA+ICIpIik7
Cj4gPiA+ICtzdHJ1Y3QgYXNwZWVkX3dkdF9zY3Ugewo+ID4gPiArwqDCoMKgwqDCoMKgwqBjb25z
dCBjaGFyICpjb21wYXRpYmxlOwo+ID4gPiArwqDCoMKgwqDCoMKgwqB1MzIgcmVzZXRfc3RhdHVz
X3JlZzsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgdTMyIHdkdF9yZXNldF9tYXNrOwo+ID4gPiArwqDC
oMKgwqDCoMKgwqB1MzIgd2R0X3Jlc2V0X21hc2tfc2hpZnQ7Cj4gPiA+ICt9Owo+ID4gPiAKPiA+
ID4gwqBzdHJ1Y3QgYXNwZWVkX3dkdF9jb25maWcgewo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgdTMy
IGV4dF9wdWxzZV93aWR0aF9tYXNrOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgdTMyIGlycV9zaGlm
dDsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHUzMiBpcnFfbWFzazsKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgc3RydWN0IGFzcGVlZF93ZHRfc2N1IHNjdTsKPiA+ID4gwqB9Owo+ID4gPiAKPiA+ID4gwqBz
dHJ1Y3QgYXNwZWVkX3dkdCB7Cj4gPiA+IEBAIC0zOSwxOCArNDgsMzYgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBhc3BlZWRfd2R0X2NvbmZpZwo+ID4gPiBhc3QyNDAwX2NvbmZpZyA9IHsKPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoC5leHRfcHVsc2Vfd2lkdGhfbWFzayA9IDB4ZmYsCj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqAuaXJxX3NoaWZ0ID0gMCwKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoC5pcnFfbWFz
ayA9IDAsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoC5zY3UgPSB7Cj4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAuY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjQwMC1zY3UiLAo+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLnJlc2V0X3N0YXR1c19yZWcgPSAweDNj
LAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLndkdF9yZXNldF9tYXNrID0g
MHgxLAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLndkdF9yZXNldF9tYXNr
X3NoaWZ0ID0gMSwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgfSwKPiA+ID4gwqB9Owo+ID4gPiAKPiA+
ID4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVlZF93ZHRfY29uZmlnIGFzdDI1MDBfY29uZmln
ID0gewo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLmV4dF9wdWxzZV93aWR0aF9tYXNrID0gMHhmZmZm
ZiwKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoC5pcnFfc2hpZnQgPSAxMiwKPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoC5pcnFfbWFzayA9IEdFTk1BU0soMzEsIDEyKSwKPiA+ID4gK8KgwqDCoMKgwqDCoMKg
LnNjdSA9IHsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5jb21wYXRpYmxl
ID0gImFzcGVlZCxhc3QyNTAwLXNjdSIsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAucmVzZXRfc3RhdHVzX3JlZyA9IDB4M2MsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAud2R0X3Jlc2V0X21hc2sgPSAweDEsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAud2R0X3Jlc2V0X21hc2tfc2hpZnQgPSAyLAo+ID4gPiArwqDCoMKgwqDC
oMKgwqB9LAo+ID4gPiDCoH07Cj4gPiA+IAo+ID4gPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXNw
ZWVkX3dkdF9jb25maWcgYXN0MjYwMF9jb25maWcgPSB7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAu
ZXh0X3B1bHNlX3dpZHRoX21hc2sgPSAweGZmZmZmLAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLmly
cV9zaGlmdCA9IDAsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAuaXJxX21hc2sgPSBHRU5NQVNLKDMx
LCAxMCksCj4gPiA+ICvCoMKgwqDCoMKgwqDCoC5zY3UgPSB7Cj4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAuY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjYwMC1zY3UiLAo+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLnJlc2V0X3N0YXR1c19yZWcgPSAweDc0
LAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLndkdF9yZXNldF9tYXNrID0g
MHhmLAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLndkdF9yZXNldF9tYXNr
X3NoaWZ0ID0gMTYsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoH0sCj4gPiA+IMKgfTsKPiA+ID4gCj4g
PiA+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgYXNwZWVkX3dkdF9vZl90YWJs
ZVtdID0geyBAQCAtCj4gPiA+IDIxMyw2Cj4gPiA+ICsyNDAsNTYgQEAgc3RhdGljIGludCBhc3Bl
ZWRfd2R0X3Jlc3RhcnQoc3RydWN0IHdhdGNoZG9nX2RldmljZQo+ID4gPiAqd2RkLAo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiA+IMKgfQo+ID4gPiAKPiA+ID4gK3N0YXRpYyB2
b2lkIGFzcGVlZF93ZHRfdXBkYXRlX2Jvb3RzdGF0dXMoc3RydWN0IHBsYXRmb3JtX2RldmljZQo+
ID4gPiAqcGRldiwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QKPiA+IGFzcGVl
ZF93ZHQgKndkdCkgewo+ID4gPiArwqDCoMKgwqDCoMKgwqBjb25zdCBzdHJ1Y3QgcmVzb3VyY2Ug
KnJlczsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGFzcGVlZF93ZHRfc2N1IHNjdSA9IHdk
dC0+Y2ZnLT5zY3U7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCByZWdtYXAgKnNjdV9iYXNl
Owo+ID4gPiArwqDCoMKgwqDCoMKgwqB1MzIgcmVzZXRfbWFza193aWR0aDsKPiA+ID4gK8KgwqDC
oMKgwqDCoMKgdTMyIHJlc2V0X21hc2tfc2hpZnQ7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHUzMiBp
ZHggPSAwOwo+ID4gPiArwqDCoMKgwqDCoMKgwqB1MzIgc3RhdHVzOwo+ID4gPiArwqDCoMKgwqDC
oMKgwqBpbnQgcmV0Owo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghb2ZfZGV2aWNl
X2lzX2NvbXBhdGlibGUocGRldi0+ZGV2Lm9mX25vZGUsCj4gPiA+ICJhc3BlZWQsYXN0MjQwMC13
ZHQiKSkgewo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVzID0gcGxhdGZv
cm1fZ2V0X3Jlc291cmNlKHBkZXYsCj4gPiBJT1JFU09VUkNFX01FTSwgMCk7Cj4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZHggPSAoKGludHB0cl90KXdkdC0+YmFzZSAmIDB4
MDAwMDBmZmYpIC8KPiA+ID4gcmVzb3VyY2Vfc2l6ZShyZXMpOwo+ID4gPiArwqDCoMKgwqDCoMKg
wqB9Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgc2N1X2Jhc2UgPQo+ID4gPiBzeXNjb25f
cmVnbWFwX2xvb2t1cF9ieV9jb21wYXRpYmxlKHNjdS5jb21wYXRpYmxlKTsKPiA+ID4gK8KgwqDC
oMKgwqDCoMKgaWYgKElTX0VSUihzY3VfYmFzZSkpIHsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHdkdC0+d2RkLmJvb3RzdGF0dXMgPSBXRElPU19VTktOT1dOOwo+ID4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+ID4gPiArwqDCoMKgwqDCoMKg
wqB9Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gcmVnbWFwX3JlYWQoc2N1X2Jh
c2UsIHNjdS5yZXNldF9zdGF0dXNfcmVnLAo+ID4gPiAmc3RhdHVzKTsKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgaWYgKHJldCkgewo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgd2R0
LT53ZGQuYm9vdHN0YXR1cyA9IFdESU9TX1VOS05PV047Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByZXR1cm47Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ID4gKwo+ID4g
PiArwqDCoMKgwqDCoMKgwqByZXNldF9tYXNrX3dpZHRoID0gaHdlaWdodDMyKHNjdS53ZHRfcmVz
ZXRfbWFzayk7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHJlc2V0X21hc2tfc2hpZnQgPSBzY3Uud2R0
X3Jlc2V0X21hc2tfc2hpZnQgKwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzZXRfbWFza193aWR0aCAqIGlkeDsKPiA+ID4gKwo+ID4g
PiArwqDCoMKgwqDCoMKgwqBpZiAoc3RhdHVzICYgKHNjdS53ZHRfcmVzZXRfbWFzayA8PCByZXNl
dF9tYXNrX3NoaWZ0KSkKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHdkdC0+
d2RkLmJvb3RzdGF0dXMgPSBXRElPRl9DQVJEUkVTRVQ7Cj4gPiAKPiA+IEhvdyBwcmVjaXNlIGlz
IHRoZSB3b3JkaW5nIGluIHlvdXIgY29tbWl0IG1lc3NhZ2U/IFRoZSBBU1QyNjAwLCBmb3IKPiA+
IGluc3RhbmNlLCBoYXMgNCByZXNldCB0eXBlczoKPiA+IAo+ID4gMS4gIlNvQyIKPiA+IDIuICJG
dWxsIgo+ID4gMy4gIkFSTSIKPiA+IDQuICJTb2Z0d2FyZSIKPiA+IAo+ID4gSW4gdGhlIGNvbW1p
dCBtZXNzYWdlLCB5b3Ugc2FpZDoKPiA+IAo+ID4gPiBXRElPRl9DQVJEUkVTRVQgPT4gdGhlIHN5
c3RlbSBpcyByZXNldCBieSBXRFQgU29DIHJlc2V0Lgo+ID4gCj4gCj4gVGhlIGNvbW1pdCBtZXNz
YWdlIHNob3VsZCBiZSBjaGFuZ2VkIGZvciBtb3JlIHByZWNpc2VseS4KPiAiV0RJT0ZfQ0FSRFJF
U0VUID0+IHRoZSBzeXN0ZW0gaXMgcmVzZXQgZHVlIHRvIFdEVCB0aW1lb3V0IG9jY3Vycy4iCj4g
VGhpcyBjaGFuZ2UgY2FuIGJlIHVwZGF0ZWQgd2l0aCBhIG5ldyBwYXRjaCB2ZXJzaW9uLgo+IAo+
ID4gSG93ZXZlciB0aGUgbG9naWMgaGVyZSAod2l0aCB0aGUgd2F5IHlvdSd2ZSBpbml0aWFsaXNl
ZCB0aGUgY29uZmlnCj4gPiBzdHJ1Y3QgZm9yIHRoZQo+ID4gQVNUMjYwMCkgd2lsbCBzaWduYWwg
V0RJT0ZfQ0FSRFJFU0VUIGV2ZW4gaWYgd2hhdCBvY2N1cnJlZCB3YXMgZS5nLgo+ID4gYQo+ID4g
KGdyYWNlZnVsPykgc29mdHdhcmUgcmVzZXQuCj4gPiAKPiAKPiBBcyB0aGUgZGlzY3Vzc2lvbiBp
biB0aGUgcHJldmlvdXMgcGF0Y2ggc2VyaWVzLCB0aGVyZSBpcyBubyBjb25zZW5zdXMKPiBmb3Ig
Z3JhY2VmdWwKPiByZXNldCBmbGFnIGluIFdEVCBmcmFtZXdvcmsuIFRodXMsIHRoaXMgcGF0Y2gg
b25seSBkaXN0aW5ndWlzaGVzIFdEVAo+IHJlc2V0IGZyb20KPiBvdGhlciByZXNldCByZWFzb25z
Lgo+IAo+ID4gVGhlIG9ubHkgdGhpbmcgV0RJT0ZfQ0FSRFJFU0VUIGRpZmZlcmVudGlhdGVzIGlz
IGEgcG93ZXItb24gcmVzZXQKPiA+IGZyb20gYW55Cj4gPiBvdGhlciBraW5kIG9mIHdhdGNoZG9n
LWRyaXZlbiByZXNldC4KPiA+IAo+IAo+IFllcy4KPiAKPiA+IElzIHRoYXQgd2hhdCdzIGludGVu
ZGVkPyBJJ20ganVzdCB3YXJ5IG9mIGNvbmZ1c2lvbiBmb3Igd2hhdAo+ID4gYXBwZWFycyB0byBi
ZSBhCj4gPiBnZW5lcmljIHVzZSBvZiAiU29DIiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdnMgdGhl
IHNwZWNpZmljICJTb0MiCj4gPiBtb2RlIG9mIHRoZSB3YXRjaGRvZyBjb250cm9sbGVyIChzaG91
bGQgc29tZSBkb2N1bWVudGF0aW9uIGJlCj4gPiB3cml0dGVuL3VwZGF0ZWQ/KQo+ID4gCj4gCj4g
VGhlIGNvbW1pdCBtZXNzYWdlIGNhbiBiZSB1cGRhdGVkLgoKT2theSwgdGhhbmtzLgoKQW5kcmV3
Cg==


