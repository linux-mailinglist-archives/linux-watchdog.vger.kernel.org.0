Return-Path: <linux-watchdog+bounces-3205-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEDBA7BD3D
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Apr 2025 15:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59E5E189EFC1
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Apr 2025 13:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F9F1E834C;
	Fri,  4 Apr 2025 13:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="XYMdSAby";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RiqazJTj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B052B1DA53;
	Fri,  4 Apr 2025 13:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772163; cv=none; b=MuSUDu+C3/1jKq4rsTe5IByxMi51imNRNXxpCOm0PhocjT6wJLe9y+Cn6sK5/VrCg7wlDCHuOMSK/r4POLyb8OJknRv+By/YOrRnDD/PuAXUo3TXoQce3OFjXZRDeI77w0azp9NouGg4MjPQvW0abySczYsUyOwVT2cyUvNvCUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772163; c=relaxed/simple;
	bh=p+Vd/gy9bqHYEnxjkZAYOoG8rQiG9whmXDxSDqJ7mjQ=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=TFKVeihpjTnKQMi85c5u8dgIdYMX9hQ6MIp9l2tAAcekCc2XlXMYcJtSDcb+tmsdvVfIGCmREejwQ+3qGA8sbDC9pb/0Wfdsq/8f4ixzeZvpEgxcEPyYE2aRh2fcY2E9SiCjHeQ9AI+C2dN6KurR1WJIo4IevWViSvH6WUerE64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=XYMdSAby; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RiqazJTj; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 86E321140113;
	Fri,  4 Apr 2025 09:09:17 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Fri, 04 Apr 2025 09:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743772157;
	 x=1743858557; bh=QFcpB6AybEix3zTwsEsAW7tA7XfKgQapOO30cIQ8+4Y=; b=
	XYMdSAbyWj6Is1BGJkmSTXM59cSDWOzo5v2vQ5i/wS3Yl1kU9j+B/nk0EpqrveoN
	TrOQgQcRWfvFSw4s1gR4IZceyvN+uSQYSk966Cqofu1sVc53AWeUT/auJwbZEWgd
	HesNXAXW4wWnTR10TLcaofwD1WqvsezFyL3qPXxRxfP1F4MrCzr69IzKn142zWyi
	TGCKM9i7fytPKGUG8tJBAwcpA3CqIeI4zfL8oW1UQ/bz6OUjc+9Eqa7jOf9t0Z0C
	DI4FFpiwF2yIR1orNShmGWHtddZrMWSMAA0MSgAYswxpS/IqLer6J2eF7IbX0hnx
	WeU1dv0vXb/G+DT2fJz72A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1743772157; x=1743858557; bh=Q
	FcpB6AybEix3zTwsEsAW7tA7XfKgQapOO30cIQ8+4Y=; b=RiqazJTjaqSUTO97R
	9XYgvbjZWUoXQ68jQWMI9Bw44ONQstaR2smtep7esqXgLnv0gSjmbyvYIP/EIXIG
	OkUi7wY6nsSrxDKm8HnEz8f/TFrqEtnneYedWaROeD0RwhyBq/yorVHfu2Aoe5EF
	XppWKif1ox06NCxLnFsWXFo7vPl38ckCOBHzBOJhTsrw25bjm9jE+nnsGLUqqHyn
	TW68bubYLZpBS7W+QYpxFeBvIsiXc3+HtUPqzDwmFjKxatA/cQfF/quFZ5iTfveD
	i/4s60CE8kNgBgtQL5AvZbqD0rhfFkxsuGEfrl4w9+Kxo7Zn20qXaFLad01DErTA
	VQp8g==
X-ME-Sender: <xms:_NnvZ9DJKQnE0KsP6RFFSfFLte8OEe5bl-Y3CDUOfdGnMc6RkeViYA>
    <xme:_NnvZ7jp0SW_WI7XpEUVKuxe2lZpSZI1s16vW-5703ROIee1Pp0Sg5i8T-yXEI7g3
    taEgOvm3NLPQeX1c0I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleduheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvffkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhkeeltdfffefhgffhteetheeuhffgteeghfdt
    ueefudeuleetgfehtdejieffhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeh
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilh
    hofihskhhisehlihhnrghrohdrohhrghdprhgtphhtthhopeifihhmsehlihhnuhigqdif
    rghttghhughoghdrohhrghdprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnh
    gvthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdifrghttghhughoghesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:_NnvZ4krXK8x_0-eKzUFt9-c_gme_nFDS0T5QDCU70TgbwywxovWQQ>
    <xmx:_NnvZ3wLi66F07hUTfgYesHurIcCD7Nq0fYdDgNyZlWGBXiTrP0liQ>
    <xmx:_NnvZyQQGZiIzGH8izpFgU_qYm5MIoQmH_AGPgYLGQ9T2hLQHGu6ng>
    <xmx:_NnvZ6bTQuH9FSa_CTu8tum0kZxUWsxrcChlGczo4fhq5r7unWV14g>
    <xmx:_dnvZ-fPA3vx2ClXLuNFdB-rVvhT9D_Aokl1tImCjVRIqFnrdcLrk30y>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8B8C92220073; Fri,  4 Apr 2025 09:09:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Te05da8092d6125b0
Date: Fri, 04 Apr 2025 15:08:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com>
In-Reply-To: <05d96c93-f9a8-42ea-9c11-2d38a7dffff7@linaro.org>
References: <20250404123941.362620-1-krzysztof.kozlowski@linaro.org>
 <8b6ede05-281a-4fb1-bcdc-457e6f2610ff@roeck-us.net>
 <4f69f618-bb9f-4269-9467-40c0eb3bc1b9@linaro.org>
 <05d96c93-f9a8-42ea-9c11-2d38a7dffff7@linaro.org>
Subject: Re: [PATCH] watchdog: Do not enable by default during compile testing
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Apr 4, 2025, at 14:59, Krzysztof Kozlowski wrote:
> On 04/04/2025 14:57, Krzysztof Kozlowski wrote:
>> On 04/04/2025 14:49, Guenter Roeck wrote:
>>> On 4/4/25 05:39, Krzysztof Kozlowski wrote:
>>>> Enabling the compile test should not cause automatic enabling of all
>>>> drivers.
>>>>
>>>
>>> Sorry, I seem to be missing something.
>>>
>>> Isn't that what COMPILE_TEST is all about, that it enables everything ?
>> 
>> No. Compile test *allows* to compile test, but it does not mean you want
>> immediately compile everything. allyesconfig is for everything. Maybe
>> you want to compile some subset of drivers.
>> 
>> BTW, I am aligning with the most frequent pattern (quickly judging), so
>> of course I also accept argument that we should revert that other
>> pattern and use "default y" everywhere.
>
> I also dug out old recommendation from Arnd (so I am not making this
> stuff up):

Right, I agree with your patch here: COMPILE_TEST=y should make a
lot more options visible but not generally enable those.

Note that COMPILE_TEST=y also turns *off* some other options in
order to speed up the (allmodconfig) build process and avoid
some options that are unhelp for finding build issues:

lib/Kconfig.kasan-config KASAN_STACK
lib/Kconfig.kasan:      bool "Stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
security/Kconfig.hardening-config GCC_PLUGIN_STACKLEAK_VERBOSE
security/Kconfig.hardening-     bool "Report stack depth analysis instrumentation" if EXPERT
security/Kconfig.hardening-     depends on GCC_PLUGIN_STACKLEAK
security/Kconfig.hardening:     depends on !COMPILE_TEST        # too noisy
kernel/gcov/Kconfig-config GCOV_PROFILE_ALL
kernel/gcov/Kconfig-    bool "Profile entire Kernel"
kernel/gcov/Kconfig:    depends on !COMPILE_TEST

     Arnd

