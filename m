Return-Path: <linux-watchdog+bounces-3697-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3370CAE386E
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 10:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0D4F171082
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 08:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B4322DA13;
	Mon, 23 Jun 2025 08:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Cuj2HlN8"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0A23B7A3;
	Mon, 23 Jun 2025 08:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667708; cv=none; b=YpZY9bs+X29PAfTIU414xU04VOJkySJdm5gUDAwrvkoJeOQS7ihuxyRmcFY9eLTx/mnSBn89McYCqecbJw3YxzFayFY5s9rssetsRqLe2/CoOqIR7GNMrqhzrclIuYLNw5Y0TN88VhgsBxPPe6ZDyBlffgwuJchqYQ6LWUWhqnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667708; c=relaxed/simple;
	bh=WgyOGh6KByq65pMFF30SHRqulkvAymZ2itS0WDt9a5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAQC+bfUgKxqWAhCEQ1EJGzL4B7IUxH2HR2M/A8+NVqGW/sLziV+InWA5agfjvPB1pEMTC+1kdzqnX4wYy1lztsTJs66VpIYRErV5bUjRei2crW+PeOBBpqp+Av2jTdxwH0MkRFQrGcTz8Zj0hxsUE2jG0QP0xF15BoKziCKZJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Cuj2HlN8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667705;
	bh=WgyOGh6KByq65pMFF30SHRqulkvAymZ2itS0WDt9a5g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cuj2HlN89tSEZvvGVZGHhqkOW70Aq9udWV1Df9Rq7vOaA3eRCxroBcZiN8BPmsbib
	 1EyF9RwgBdC5uQfcDgqizozK8j1mW9QWmd29UCPImPfHBemloT/aHcbkDg/eDUlHWR
	 ZbhbqyJF0OY6N19cLH0AevLacrYpMp1g/HDskTRISNb1xkCYuGRBwAPZz4zScyRZSP
	 FDshKbOKB7G4APlt2RRE28v0aOLIg9ok0Qire4uR3y+0YrscpvzTJ6VnuJ8cmARtgS
	 /gq/kwT2hiFZNdU/LIfzxUs3fdCWQ8Ur7Y3xG+ZNTuifRDMCjprhFtJrT7V/f5lEXe
	 OhCamWIc3rXVQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D211C17E0202;
	Mon, 23 Jun 2025 10:35:03 +0200 (CEST)
Message-ID: <8710877a-9032-4d27-99ac-891d5940f187@collabora.com>
Date: Mon, 23 Jun 2025 10:35:03 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] dt-bindings: timer: mediatek: add MT6572
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
 <20250620-mt6572-v1-3-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-3-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for timer on the MT6572 SoC.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


