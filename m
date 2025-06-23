Return-Path: <linux-watchdog+bounces-3704-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B28DBAE388A
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 10:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E67051894B47
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 08:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17EC723643E;
	Mon, 23 Jun 2025 08:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="E24sWwnd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B317235059;
	Mon, 23 Jun 2025 08:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667723; cv=none; b=KvEQv1RTNtH/XDlJ8bJXPUIY61bhK+gsuXBHSbvrAvUhhKC7/lOD/BTcK8PNXOXEElQeZjrOEAVa4Rl4/hLtfO9fiyGgvQlxayo2UjZXPA4jC+iRPu2n23Y5U/N7Oc1lfLRrrkdIAGwhr0TsZCJgH5o0/9LIrgjs3BGkz/Tf8oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667723; c=relaxed/simple;
	bh=8cvOVWSgYMO57JWfjmueorCmKRsqrIQ8/Cmhi4HtF1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nkexu2O9oFpn9v3LGdMgNTEYRmx4QKHTL7larMmXj2Irgoa0Ubgr4vSaRWPzShZjGMuUP+fIzTIHQnvHH+utt11eEWUimMjMksBhDhZFiAcaPAVyypyH5rxpzUlMmhb1QZAxdrNxfoTFtUb004uYoPt/kp21+2P31Uo3lQUD8FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=E24sWwnd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667718;
	bh=8cvOVWSgYMO57JWfjmueorCmKRsqrIQ8/Cmhi4HtF1o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E24sWwndWIspXU3CJ0hu9uoYozOk+07HfBHNlezTZWrIGLDpCS+U3L/0SWBWMu7Zn
	 HMvdW/2dh8su1Pj47sU2jO7I8HXCimhlWcK2mDX8N3GadsrpJ0Kz0MFRJxbJMOF4o8
	 YuMenUinXVd6fhaE1WGh84X/UAecbfFI6GU16uWIT2DxFjXybBcG52eBZDuRQgvH4r
	 kVkhMZ3nBNlSrKPuB7CkxXEUHGAnf1NdJeHia6rWMv7/TJ82lAUYkPiZsE22pHZVu9
	 rchFTRoZgTVQgECGmwxVa9pC+61cTv0xFGzsCIMhIbSraQB/CkrnImmpKVRMEQ0Tqg
	 RzW26OwLBt7Lw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DBA2417E1580;
	Mon, 23 Jun 2025 10:35:17 +0200 (CEST)
Message-ID: <b6c15bdc-95d9-4690-ba9e-f5eb9ed77029@collabora.com>
Date: Mon, 23 Jun 2025 10:35:17 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] ARM: mediatek: add MT6572 smp bring up code
To: wctrl@proton.me, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
 <20250620-mt6572-v1-8-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-8-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add support for booting the secondary CPU on the MT6572 SoC.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


