Return-Path: <linux-watchdog+bounces-2816-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F78A24029
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Jan 2025 17:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D096C1683F7
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Jan 2025 16:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1CA1C75F2;
	Fri, 31 Jan 2025 16:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="imtzkOOz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ibmkxLo1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82F08467;
	Fri, 31 Jan 2025 16:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340285; cv=none; b=eFVR2vu+5kO6YRGGcjAUIwbKprDPftmPod7ENmaBRy31K1DSo/qWTjAT/V5yJf1YHtXuW4LksEvEYRbsdqzE8cu9xg55Rki8STWRQYhiR3XjMKIhN71B9PTDPF3muRSgGvbHBavwmZy2eL3pwYXpuForZcElTf4DTsgrY9WUNEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340285; c=relaxed/simple;
	bh=zrqi3hXuCg/pOAs3BM+Y8qLb9r9I1zt3QwyRMaxjl4c=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=iZqxHQV7Vp1RN/eTVo+sWWWwlZFyo4VQ+aA85W00S532AdMtlJ5tny9+WvsN98vOUCf9Wi1SqpIyXCa4sSg+azkhkftj6PRt7fDiV6mmhK7W9eBslLEsQvC3z+K7p+vjYPDw5ieWKMezX9z4pdIOHlft3gZMCsB/Qdq0ugbx9UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=imtzkOOz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ibmkxLo1; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id C99E713801B9;
	Fri, 31 Jan 2025 11:18:01 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Fri, 31 Jan 2025 11:18:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1738340281;
	 x=1738426681; bh=tctp8a/ADsUOAVTFosNL9TM08hrtr5AOZz+znhkKVOU=; b=
	imtzkOOzlMo9KTK/nb3nUb2KdgXwlaZYZYAndhGa55juPdi6Xv36jRVx/OTwr4Xy
	FnAqzVsgzrGLiqqNNw/njAj13qS4IIbdJGDZZT4Da7g6+YRZhJITWO3nOcdM2qrz
	jsD3gsXhefXVWAgMj2ppZuAm8Jkf1EbFJm8LTC8zhl9lX8ka0srq6JiUgs0UN6+1
	xy8YWENByZhKxYzQNZIyUnOPq7533Q0T7914OOh4tn6kJXN5b9QFS1gDajhCpNde
	TeZf1JOZ1qyJjKF4UKHLsn5odnNMWmMPCM3N/7wUiLLqIrnzPyYWL2FvJZnuCvuA
	eeJKnrcw2Hbx3yz5kSsOsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738340281; x=
	1738426681; bh=tctp8a/ADsUOAVTFosNL9TM08hrtr5AOZz+znhkKVOU=; b=i
	bmkxLo152X2bvbVY9iU4JFWhM5MV01Qmjz0qexyUSeEoZKhywyv0lUhpT1WNgveH
	20aiFxuqRtPATycraMZf00iPr8JAXzbwP6kQaMMyRDjXmJsd0GsuHr1Gc3/V8GNS
	VZV2MX/l9yvEWAY0YV/keLVSZKSGI5D10PbNb9KE7rvmaZNU5Y6EVQBEYZ4nVTfb
	NU4fr8tS/e1rHHPtHLJd+6Siboz1Tj2PTz+HYI+rXrLrPpssglZ4YY+jEwzZvnFB
	oSfkA+WugddpMfDJKMvvBMtKwP2lyJDD0cg9hXco41aEN92U6+ifeS7b+JLTiavw
	6GTx+TwkNqO/2Odct8yow==
X-ME-Sender: <xms:ufecZxSgHkis6yjCT4DIzKS9u2PXhdICIaL6-h_h3LaWkQYiXuUSVA>
    <xme:ufecZ6w8QmtiOUgM76E-etoGPnlHxaDDIgPZxh-ndckKe5JMIAr3ave92AX74gOcv
    Z6shjst6eLobYQwlDE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnh
    hovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhuedvheetgeehtdeh
    tdevheduvdejjefggfeijedvgeekhfefleehkeehvdffheenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhho
    sehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopeguohgsvghrsehlvghnohhvohdrtghomhdprhgtphhtthhopeifihhm
    sehlihhnuhigqdifrghttghhughoghdrohhrghdprhgtphhtthhopehlihhnuhigsehroh
    gvtghkqdhushdrnhgvthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdifrghttghhughoghesvh
    hgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ufecZ221pjsUz9LC7-ruHq95Yuv5ugbRAONUmngi6Jrw7fww74FTpQ>
    <xmx:ufecZ5CZWjhtjtrWY2oPnpMapOmrbVtyQzyiBW0V0Bjzi2EHkiLO2Q>
    <xmx:ufecZ6iGjhE_2MBKcznQWww37Y03ypbAKHo3JuBbVaoM5IrdmLq42A>
    <xmx:ufecZ9rhcNolYYHxmnO2rUAl4Hs_kTBbLsooeXcsYpWcXN99BpFlAA>
    <xmx:ufecZye5Kz66PeK6thIEFU7IrXEC2HAHPHqIbte4XNqQlrbLL_p8XKM4>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5800F3C0068; Fri, 31 Jan 2025 11:18:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 31 Jan 2025 11:17:41 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: "David Ober" <dober@lenovo.com>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <c0981f17-1577-4f1e-ad38-919820f30c1b@app.fastmail.com>
In-Reply-To: <c7571180-c643-42e9-b2b8-4da07c9394c1@roeck-us.net>
References: <mpearson-lenovo@squebb.ca>
 <20250116182912.1844-1-mpearson-lenovo@squebb.ca>
 <c7571180-c643-42e9-b2b8-4da07c9394c1@roeck-us.net>
Subject: Re: [PATCH v2] watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo SE30
 platform
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Guenter

On Fri, Jan 31, 2025, at 10:44 AM, Guenter Roeck wrote:
> On 1/16/25 10:29, Mark Pearson wrote:
>> Watchdog driver implementation for Lenovo SE30 platform.
>> 
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ...
>> --- /dev/null
>> +++ b/drivers/watchdog/lenovo_se30_wdt.c
> ...
>> +
>> +static int lenovo_se30_wdt_set_timeout(struct watchdog_device *wdog,
>> +				       unsigned int timeout)
>> +{
>> +	wdog->timeout = timeout;
>> +	return 0;
>> +}
>> +
>
> This function, as implemented, is unnecessary. See watchdog_set_timeout()
> in drivers/watchdog/watchdog_dev.c.
>
Ah - good point. I'll remove this.

Thanks
Mark

