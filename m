Return-Path: <linux-watchdog+bounces-3108-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B175A61833
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Mar 2025 18:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13E2118840E3
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Mar 2025 17:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852CF202C55;
	Fri, 14 Mar 2025 17:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Qr8eTlcI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Pn6W0vyz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAD614375C;
	Fri, 14 Mar 2025 17:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741973992; cv=none; b=oDaW0CkgoDEaeeoELQ0sMzocizw5MnxW5QpfvMjRbWJM9tz/n2FYGwMdg+D6+p98h6qP/kWD43fgcVtMTXE6al27T3bvnqJOuQ6/18K5rqHJ+psh5M4nsegE6Smt7dpIYsi3zoRLfMT905rLXoFPdNtIs+cVYTwx0LAjRJr7vDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741973992; c=relaxed/simple;
	bh=vBWuUB5Jw4eDAej2/Yv6HHL10/QEJgGXLaT+W3wBRhs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=cSjvx5vzgvg1uTlxkxbnaVZ1/KGw1xO/UmP1JQFbOn+p/23szCvQwJRs+7UXbTWNXYunH0pkobJh0ohxTRRb3kHxCmMb8Pogv/QN2eidfKreMgVyg9F0N0hTMfXyQGKUD7P9NMeKZ9OsIazlOrLcjZMGZJkSwk93zWFgRGIk3hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Qr8eTlcI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Pn6W0vyz; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C545711401C7;
	Fri, 14 Mar 2025 13:39:48 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Fri, 14 Mar 2025 13:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1741973988;
	 x=1742060388; bh=V654k5pAF6D8HBfTFnPa0CB2pEJli9tIg/z2exl4uXI=; b=
	Qr8eTlcIyalonhqSe3CMMnShEhk64haYwLN+WFQBNNmIpPTFpm5AvPSeySuFnbu4
	06DjpP1vn00N+a4wSG9pJwAsmsazhEIPnu/azKhy6j30oUhpxBALpwyuHE8B5kPT
	/rnittt3L7j8lTJFQkIGI5vAjcVEIYAnwZ1wSZgPsuQeusW96EkEwgfvm7JpTFwL
	lX5GZiqPj8vSKO87yNCtGhbtSCU9xQ82s8MljLTXlfC2ntkKmXkrsW56Y4Rry8fo
	5KpajimJCD5b+yxQ38BjLSVVllKoq9TyTmxegvF5nHVgd41eHApaCNcloN2mAHAa
	jQ/8iMIVpcEmyyUqs2b4ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741973988; x=
	1742060388; bh=V654k5pAF6D8HBfTFnPa0CB2pEJli9tIg/z2exl4uXI=; b=P
	n6W0vyzr7uqXgdLHioKInC9skDEvsGv9sz0cdE9SbSZafPZg1OJOGOOUlo/ROvQr
	Z3R5Qx6N5EoYdl/0VfVuvuWQEVRETtEG+rUH7T4GZq9UMS9aeHWzOniKO1dnfjS5
	ybj4TokSf93pddhbJygqBuM0CI9Y5FQVHbxprBTKTaE9vkAYx0aeXeORHvdf6MUN
	1IsFibD3ZQzI1c5T3xgbx9WrlvniZU7F7Wq/8htMOtXhRt8fQVXiaHlQyG8ad2Mg
	JvSMCiAmSqJxIkwbQvYOmdr1G8LJhc20jIdfYi9GDM74Yy6zmAYr/IrRAUdI55jt
	67hHqX6RXfrOKacg7jcWg==
X-ME-Sender: <xms:4mnUZ2lrmvRoitLLGC7J7zFoy0_UjShHEUECn0srorIY6utafG-1Vg>
    <xme:4mnUZ90tAj0nRHqsU70IO71IUU9EUzVNHtR5rx9oC4i4BrAMSEvTw-4FlHvBGKijC
    qfMZHWTfUBiYffkEdY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedugeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegthhhinhdqthhinhhgpghkuh
    hosegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhopegrnhgurhgvfiestghouggv
    tghonhhsthhruhgtthdrtghomhdrrghupdhrtghpthhtohepjhhovghlsehjmhhsrdhiug
    drrghupdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeif
    ihhmsehlihhnuhigqdifrghttghhughoghdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphht
    thhopehlihhnuhigqdgrshhpvggvugeslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtg
    hpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4mnUZ0ptPtSAVK1mCgpsk0UTZ9p1VWhNSw27vSVwy-mk6G1v3gYdIg>
    <xmx:4mnUZ6lw4KXvrER1UjC36CTwtAgNfBBxvG7bZIhcGpn6-Hks-m9PBA>
    <xmx:4mnUZ02S1-ucRISkk0NH8BJ30_Ve143dMVMW1FZgPTP74EeqWmXBkg>
    <xmx:4mnUZxsVHT5G6bxA-tZ6iUZoAr5Tm3H1zOONT4JsO6ABbnDW3v_ZDQ>
    <xmx:5GnUZ6wNh2imRHzh5dAn9BBBmxi2uzGZTtr2T3f9wYYhUMbc6zHlQw0Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5145F2220073; Fri, 14 Mar 2025 13:39:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 14 Mar 2025 18:39:25 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, "Arnd Bergmann" <arnd@kernel.org>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Chin-Ting Kuo" <chin-ting_kuo@aspeedtech.com>
Cc: linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Message-Id: <71b81647-aa39-4c33-b92f-2c9e6d1e606d@app.fastmail.com>
In-Reply-To: <9ff3ba59-be59-4a2e-ac1a-5ce23b1b3fba@roeck-us.net>
References: <20250314160248.502324-1-arnd@kernel.org>
 <9ff3ba59-be59-4a2e-ac1a-5ce23b1b3fba@roeck-us.net>
Subject: Re: [PATCH] watchdog: aspeed: fix 64-bit division
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Mar 14, 2025, at 18:37, Guenter Roeck wrote:
> On 3/14/25 09:02, Arnd Bergmann wrote:
>>   
>>   	if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt")) {
>>   		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -		idx = ((intptr_t)wdt->base & 0x00000fff) / resource_size(res);
>> +		idx = ((intptr_t)wdt->base & 0x00000fff) / (uintptr_t)resource_size(res);
>>   	}
>>   
>>   	scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
> Does that help if the pointers are 64-bit on a 32-bit platform 
> (multi_v7_lpae_defconfig) ?

Yes, that is the problem: resource_size() returns a resource_size_t,
so this is a 32-bit by 64-bit division.

Pointers are always 32-bit, CONFIG_LPAE only changes phys_addr_t
and resource_size_t.

     Arnd

