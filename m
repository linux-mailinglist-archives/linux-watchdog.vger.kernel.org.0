Return-Path: <linux-watchdog+bounces-2964-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 930FDA3AEB2
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 02:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32A57188406A
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 01:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB6425757;
	Wed, 19 Feb 2025 01:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="GG4Nw1bv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88E1A920;
	Wed, 19 Feb 2025 01:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739927577; cv=none; b=lDoTKZa3AqVpgHpG5O3tXX/m4OLeX9SWKtDc8YMoMxoL8JVTOK1+uLvAMNS7HXuzD8mNeBJBoLtpvbPEdYuG8eK1DL4obVNw6Wqb8HAa3NGqabQPs3Av4Xzk9jEcAw9pDhhwP5506A/QpzuLOB4g+ciFCRYz7uDlPX8yrmlI91c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739927577; c=relaxed/simple;
	bh=Ni1r638kXhz6gOBSh0GzjFMf1Ey2XUVcA0yKk/KtpJY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TsO2WpY4BoCEwVBl7itgykdSK6aSZ9LWroPlJ4q47+g7d2Z6AmBf4fwLTCuXbpNnwVEW5GJ3V+zIGf+ibPk1ThSXLc+atBMcRWX2P1zCaRpThfUKFgNcrIwPr1kd8VFeRES0Bm5Kryjq/WkoPIv/XQaZH+NgO6i2p7FUCy2GHtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=GG4Nw1bv; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739927572;
	bh=Ni1r638kXhz6gOBSh0GzjFMf1Ey2XUVcA0yKk/KtpJY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GG4Nw1bvSKh8tDf3E+2t/uMIf7OolfOAl6mSmUWL6zpk45Zsy2/B31/S+KrMPCKx4
	 ptMe2y+TaQ2da9TTRW4kF91rgL/iQlVLR8uTcQTUm/mkyAlBGk2h+6SjjiBPdty042
	 h6X9e2gKDVlq9GIMEyIiGdMm2RHoRjy9z9B9qsjsIku2Ec1nKqcf7b75A5v1Nw7cR5
	 3XUMMv21fA2X652KA2KlzJ3oMwWKUiie9gAbHsrtYmI3bTWaF8gzoZDIEvzvccX30x
	 2uoYuiCFfVP9hCm3IzcbGoVzFO5AHfBXbNNAq3JxbEULwt1kbNRAwVTXLg2nANYCZJ
	 SBKyx4CtVg8PA==
Received: from [192.168.68.112] (203-173-1-6.dyn.iinet.net.au [203.173.1.6])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ECA6176191;
	Wed, 19 Feb 2025 09:12:51 +0800 (AWST)
Message-ID: <a7df160add1563a69573e00af44caf8bb73f520b.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: aspeed-g6.dtsi: enable IRQ for
 watchdogs
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Heyi Guo <guoheyi@linux.alibaba.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Feb 2025 11:42:51 +1030
In-Reply-To: <20250218031709.103823-2-guoheyi@linux.alibaba.com>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
	 <20250218031709.103823-2-guoheyi@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgSGV5aSwKCk9uIFR1ZSwgMjAyNS0wMi0xOCBhdCAxMToxNiArMDgwMCwgSGV5aSBHdW8gd3Jv
dGU6Cj4gVG8gZmluYWxseSBlbmFibGUgd2F0Y2hkb2cgcHJldGltZW91dCBmdW5jdGlvbi4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBIZXlpIEd1byA8Z3VvaGV5aUBsaW51eC5hbGliYWJhLmNvbT4KPiAK
PiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBDYzogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6aytkdEBrZXJuZWwub3JnPgo+IENjOiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtl
cm5lbC5vcmc+Cj4gQ2M6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+Cj4gQ2M6IEFuZHJl
dyBKZWZmZXJ5IDxhbmRyZXdAY29kZWNvbnN0cnVjdC5jb20uYXU+Cj4gLS0tCj4gwqBhcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQvYXNwZWVkLWc2LmR0c2kgfCA0ICsrKysKPiDCoDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMv
YXNwZWVkL2FzcGVlZC1nNi5kdHNpCj4gYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQvYXNwZWVk
LWc2LmR0c2kKPiBpbmRleCA4ZWQ3MTViZDUzYWEuLmVmN2NlZDI4NWM0NCAxMDA2NDQKPiAtLS0g
YS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQvYXNwZWVkLWc2LmR0c2kKPiArKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQvYXNwZWVkLWc2LmR0c2kKPiBAQCAtNTM4LDIzICs1MzgsMjcgQEAg
dWFydDU6IHNlcmlhbEAxZTc4NDAwMCB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgd2R0MTogd2F0Y2hkb2dAMWU3ODUwMDAgewo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb21w
YXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLXdkdCI7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDFlNzg1MDAw
IDB4NDA+Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGludGVycnVwdHMgPSA8R0lDX1NQSSAyNAo+IElSUV9UWVBFX0xFVkVM
X0hJR0g+OwoKVGhlIGJpbmRpbmcgd2lsbCBuZWVkIGFuIHVwZGF0ZSB0byBhbGxvdyAnaW50ZXJy
dXB0cycgYXMgYW4gb3B0aW9uYWwKcHJvcGVydHkuCgpBbmRyZXcK


