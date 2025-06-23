Return-Path: <linux-watchdog+bounces-3698-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB20EAE3872
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 10:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1094A3AD69E
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 08:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF0122DFF3;
	Mon, 23 Jun 2025 08:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mQwacOW5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE4F22D4C0;
	Mon, 23 Jun 2025 08:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667709; cv=none; b=OW65GRafgZ1gKQrNxwZAQZc1zaK4hBmm4D3qhm/U6IhQrdRF60b7tYFBhx9HQNYywG7xG4McNnMd0oJXid6u/oDC18IINH4td/kpdvF1vVeVyNUnIcyvDi7Aknt7hUvNT6D5TdTl1yKHvepy8ajxVF0vej2SLZRfKN61s40lln8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667709; c=relaxed/simple;
	bh=VwC3o9nmLlXzHPPAlg+0xEd8Tk3pdHX/MZbDjVfbK0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNf1CLCi9RT6Pr2SfWLiaMwkbuo0wRedQO2e7C7G1jiKomivUUndVc8Zxc/68cs3dOVLNrv3MfFKQRFqEf8fM1f5Ka5Z1s5mrb8kFhhz65reoZAq8COGYmQGd5+NLyyZbYK++DMZ3hQJrXX+4rrgA9ma60/X3+90uCKBoW8roi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mQwacOW5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667706;
	bh=VwC3o9nmLlXzHPPAlg+0xEd8Tk3pdHX/MZbDjVfbK0s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mQwacOW5Xf3+d5X4mSOolPyXeTp1VB9Cn3VbSe56iQGOptXa10E1mCqWOkBCJFQ7n
	 pqnkatAeUqWjibQaNvImQAVQeZYI39TNn7P67R2U12rMCXqbxZmcRTJ/x7c/oqR49H
	 iQcME9hdrlytJS9HxWY8Im6i/YkwjCEc8ZvfIka0Anj7Y9LbFuLn7rJ8nZCT/eseth
	 LOlvizUvDUi8I0SOqcf6GGpWEF7LG1Q6QbBh46otgb2y6JeINt28FR3OHK1XDikY+M
	 Z43QNllIK4VyjyCf5BLf0SVjXoffcVdx2PAAhsEcFCCzyiz7wG8z3d39WI3SgnYOrr
	 Fj3ZGuajHppHQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3237917E090D;
	Mon, 23 Jun 2025 10:35:05 +0200 (CEST)
Message-ID: <d7c4404b-0a29-494e-9432-352a80934270@collabora.com>
Date: Mon, 23 Jun 2025 10:35:04 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
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
 <20250620-mt6572-v1-4-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-4-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for watchdog on the MT6572 SoC.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



