Return-Path: <linux-watchdog+bounces-1400-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C69932842
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Jul 2024 16:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D24101C21A14
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Jul 2024 14:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACF419CCE4;
	Tue, 16 Jul 2024 14:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Kr38KrpQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UKpFOr4/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D86619B593;
	Tue, 16 Jul 2024 14:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721139815; cv=none; b=Ajqpcv6O0KbhUmS952x2DSh84ptPg8EFXcK/LOS43P4GTkKcR76KqwMhzgDlBaVBsGmre7cxyPNP4xNKkZ3yOPLzb4mFJUFOsFuWIxv5aNGO3McTQbRDxN1JkY611eLM2Zt2nxumpyDLAmArR5PLwnWcpvm3UKxmVAQM2ZkzGTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721139815; c=relaxed/simple;
	bh=E7ypFtpvfgmkGHvNpsJg2xVn9bjEX/pSLpLPWHddrdQ=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=GDZ/u8OhXv7LuGcDhYGYdV0xyBgMXhaxs1auzTU08rARNnqka8eXkWjQ/0hQZU5000tJXjApfeqp5NLEwI7W6YM6g4zTHuLOdoEBf1UpjXEuiX41UB33nfvEBTHqj24vBgXCTgJCJEI1wYNAsGBoGmd+MghH/yegiW8xpCGXvqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Kr38KrpQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UKpFOr4/; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 3DEB711403B8;
	Tue, 16 Jul 2024 10:23:30 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Tue, 16 Jul 2024 10:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1721139810; x=1721226210; bh=6Y3UdmOeL8
	LalOZK3VA218nR0Bb5Owbmu16C8UWhXP0=; b=Kr38KrpQtX9mhQZGqghSEOkMJV
	9y62WdPWidLufS6hY0ZObabevCXDSv6TID5QU5dZzIEKZd+wUScf87f3vYGbHjnc
	js4pE/FZxlX1It5PGBWU2OmbsnztSNXZ0vaIjawCz/uLh4T/6Y4mgLijuI5JLk4S
	erBEyb4z0AKl6ROOZMOGwqIwu2kDFqEBGRsGiiK2LQHnz7vdubsRo0zNOBXTBeG4
	sKol50ruv3yWsjbKcRX2mcvtTdywoLiujNU3DQZmNFfRVmxd3bHKEhE5SYrHKHiz
	Vv89eGhVWQRglaxoCkFxs4UAZftLuyyOPc+e2i2xUthdudMRacaOCeTySP7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1721139810; x=1721226210; bh=6Y3UdmOeL8LalOZK3VA218nR0Bb5
	Owbmu16C8UWhXP0=; b=UKpFOr4/Gx4LfQA3w1qHgtOJM+7U5a8fqf80yInab0I4
	/bsbuUnOoMKN/WskJG0rg/YelKpo9dIToRy6RYLDJjbpWybVAJORAEBnIw4ztjm6
	EIvR/lMvn9MTwkqjfC7YPVjn4BRssYlzgcPS+xTnkKO35BsRF6OcCM49EHrATVrI
	YSJQBB9zFJVmp7B6itUmRT53lZNnA6J5UlL/0dphhBaHZ9v5vg3M59/hdzPoHPfX
	z+z+QUjA9fz9ql9S5oHLveT3KsLUckYYzorn8KxnTTlgtZYMO7zix8ubl+/krEJ+
	alYtQ9kEtGPxy9r3inaK1MX5Y9+CvOuAfPWizNcLFg==
X-ME-Sender: <xms:YIKWZjGLgoAOzX1xYlqInQmCbmTHMktqyOqm3l536FcnLaSF7e-7qA>
    <xme:YIKWZgVmxReI1Rn4iteN3M6N87WF9t6m4ADFxpfirUWAombmtukacpgIlfEXxrhr0
    h3TCI8wXqzCr4YaQqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgeeggdejhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdforghr
    khcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrd
    gtrgeqnecuggftrfgrthhtvghrnhepieeufeejieevteduvdekteefledtveffveduheff
    feejudefvdeijeegudegkefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
X-ME-Proxy: <xmx:YIKWZlJGsdKNLwQSmC1hqptH6E5_V0s2eXT2Nbg_hZLOcdNzZMCvnQ>
    <xmx:YIKWZhEJJC8CPqgheKDudFFMftsYN1A1wJ64FQ-wu82VetUbeNeHfA>
    <xmx:YIKWZpXmbMg43HM3rCb7k5DA_sIQVrvxsJMeH9DkJjEu9VlFaVSQYQ>
    <xmx:YIKWZsOnynUx_9Cjj8WBJ5u50e6dS2FGMd7GI-SdtYUWuZ43jD97yg>
    <xmx:YoKWZnf9kvqwkNC2qoeeseHU6suRrqaG5Hwr8G2lehfg4Zkp3bbzoCdy>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5A234C60097; Tue, 16 Jul 2024 10:23:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <dee10300-9441-445f-9d32-3a23e922cbc6@app.fastmail.com>
In-Reply-To: <464a6eca-e981-402b-a14c-61439d6fa4f2@roeck-us.net>
References: <20240716030725.400400-1-nichen@iscas.ac.cn>
 <464a6eca-e981-402b-a14c-61439d6fa4f2@roeck-us.net>
Date: Tue, 16 Jul 2024 10:23:06 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Guenter Roeck" <linux@roeck-us.net>, "Chen Ni" <nichen@iscas.ac.cn>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>, "David Ober" <dober@lenovo.com>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: lenovo_se10_wdt: Convert comma to semicolon
Content-Type: text/plain

Hi Chen,

Thank you for fixing this - I should have caught this originally :( 
I'm slightly bemused that it worked at all.

On Tue, Jul 16, 2024, at 1:29 AM, Guenter Roeck wrote:
> On 7/15/24 20:07, Chen Ni wrote:
>> Replace a comma between expression statements by a semicolon.
>> 
>> Fixes: 1f6602c8ed1e ("watchdog: lenovo_se10_wdt: Watchdog driver for Lenovo SE10 platform")
>> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

