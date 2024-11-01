Return-Path: <linux-watchdog+bounces-2404-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB03B9B9175
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Nov 2024 14:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 000C61C2137E
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Nov 2024 13:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D9219CCF5;
	Fri,  1 Nov 2024 13:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="EkXtSx78"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0417015F40B;
	Fri,  1 Nov 2024 13:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730466161; cv=none; b=fj+yakx1/Jftzs57dew3CODvzGiPEimE08qBWDn0/ZdKd6fVJvfxH5SGB2NpVYqUFhO9fUBbHmeh21YvC9w0xESDwq1ZoVagPd6xOd1H8t9Aolkhx8pEya88iV4vJhpC64fxQi09je3C6lUL/A7tf8sWTd9D7NDwlLJ95NncUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730466161; c=relaxed/simple;
	bh=nhbHZKbxhPcBXuHUqFG2yiYnaslxZtegal/zrhaoRY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EeYQB4EZs4eqphXxGjv9M8hJOyCHx9JqjF18UV6Gg97W1MzZKwEoQCYfuJonVCbCiMvrLvggtB5A6+hBy5vaEesfL1y4Aur0K2OoitpT62dcobBgVZVkNC6IM3KX6rERmtIa9oJ3Uu9LfiqCM9HY+fz5qQ8n1ewvobXWTuLZf6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st; spf=pass smtp.mailfrom=marcan.st; dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b=EkXtSx78; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 4C2554346B;
	Fri,  1 Nov 2024 13:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1730466156; bh=nhbHZKbxhPcBXuHUqFG2yiYnaslxZtegal/zrhaoRY4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=EkXtSx78tsnEiLjKYpIO8q8ZP5aZBk3HctrUH0NJltK2p8lzJIfy6zAjKtIR8P7eH
	 RfcMbu0PdhuCadcd3pe3T4v8fHM+bQegql5sDqNhEkgv8ze6orUF1BPaPasiTvBYpP
	 finfnvZ5tr0DMuw8H23A5xS7xroVhGKJ/Cs1G/uDM5EyWaXCmX9YzfY2v/LlPz5YDE
	 q7JAQ4Q3oXcnkVlxwaffNgTBgFwsMTKaM0kbz35Sw3NWzmkOJJ2CPiDiP+87mmz285
	 5sdchaQEkiVbJzoJZEj20mvIVx9pgkLejflylzD9RyO1RUUZlsuc20zweQkmNT8zjs
	 Fx/TZXD2w9cYg==
Message-ID: <2f03a7aa-cd74-45d1-b56c-ab19c19d9632@marcan.st>
Date: Fri, 1 Nov 2024 22:02:34 +0900
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND 0/2] watchdog: apple: Increase reset delay to
 150ms
To: Nick Chan <towinchenmi@gmail.com>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241029013055.45538-1-towinchenmi@gmail.com>
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
In-Reply-To: <20241029013055.45538-1-towinchenmi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2024/10/29 10:29, Nick Chan wrote:
> Increase the reset delay to 150ms as the Apple A8X SoC can take up to
> 125ms to actually reset.
> 
> Since the code is being modified anyways, also fix a bug where watchdog
> writes were not actually getting flushed after requesting reset, depsite
> what the code comments said.
> 
> Changes since v1:
> - Fix an existing bug where watchdog writes are not flushed
> 
> v1: https://lore.kernel.org/asahi/20240930060653.4024-1-towinchenmi@gmail.com
> 
> Nick Chan
> ---
> 
> Nick Chan (2):
>   watchdog: apple: Actually flush writes after requesting watchdog
>     restart
>   watchdog: apple: Increase reset delay to 150ms
> 
>  drivers/watchdog/apple_wdt.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> 
> base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d

Acked-by: Hector Martin <marcan@marcan.st>

- Hector


