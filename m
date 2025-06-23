Return-Path: <linux-watchdog+bounces-3702-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FFAAE3882
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 10:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80AD8171BA0
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 08:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71111232376;
	Mon, 23 Jun 2025 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="edcb6j8Z"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296FB22DF84;
	Mon, 23 Jun 2025 08:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667718; cv=none; b=etH4N50nkygFzl90btzmT5NIUhNNBcLwq0/+rVXxDyVXZschkFqkEAikoMdgr7G+6ltxfjmhi+kr+6v+3aF1nKPO89fRXesfx4SrMoWtHB65F+YiObIxKSFEb0tn5qAUFHhuUETrqCOvf//febEOsMbW6GcXMo61rSU6sYY90uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667718; c=relaxed/simple;
	bh=BVqyDTmiCEkrBVIJgwDyuX0wGNoR5DAzI5LXVrpra9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJo1olLbcQ6vT5gLVWrEvlkJ+Tb4B56ebWd13O51OxMo7L2KgjV3mj/YwStR8xCi9PkfIiGxw20d7aNlWQTTiqwtwSKc54F6mfGtKTX6DhGI+uGjASNnTJjvaCAUuOKfHlsfsX4oJ+Am4/FmPC9KJKNZMG+1BW+AXtxBnQjEfR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=edcb6j8Z; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667714;
	bh=BVqyDTmiCEkrBVIJgwDyuX0wGNoR5DAzI5LXVrpra9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=edcb6j8Z3c/hA370Bv1g0g0X9v6ea0lu3zioME18VSKt6blqD+VzSR13tUiZk9edy
	 BwIott1YjJoA2XA2u8XqaqLADyXYfqEnoNC+ll18uRFN/Sc5dO8Bi7sTwbn+1mS3r0
	 mDu3BGLYfwcNMOh/Jx+HA3cOFXUMPXBNr1z0GQGI3SYRKXsftVOYs3HoM0x7sOgE3t
	 F4x0PI2xuRljZg6RH33+3HXfw/mS2oDpnZZaccO11Tu63wmKyg3QQmKF3/V11gUSn2
	 b1PhQwp342cSMQMGdY/Yhr4h8JntkzGwtpbyacXMIdcaO7ddRwjHaBefFm6cIOkh6Q
	 /qnHxtwAl4jOw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 81C3B17E156D;
	Mon, 23 Jun 2025 10:35:13 +0200 (CEST)
Message-ID: <41a90422-6137-4bdc-b268-29f420ed50aa@collabora.com>
Date: Mon, 23 Jun 2025 10:35:13 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: serial: mediatek,uart: add MT6572
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
 <20250620-mt6572-v1-1-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-1-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for serial on the MT6572 SoC.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



