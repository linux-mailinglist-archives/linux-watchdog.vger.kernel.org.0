Return-Path: <linux-watchdog+bounces-3701-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E99AE3880
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 10:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5D453B1CB8
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 08:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E834A231848;
	Mon, 23 Jun 2025 08:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nhoxjTaw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2755D23182B;
	Mon, 23 Jun 2025 08:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667715; cv=none; b=s/x924FN57r2iqmhGOBG9JTUILD8pYNychK7Ig9nTTLBbEWohcYoYLrfzHZtwoorQlCCuAvaVSVM/kvkrnxmrUrdHfpbutXtGG4n96jAqbTjXHWS3N5lTFt+JAO9NhzGL21UFxkxD7siFYHWCMXQnWUbDa8IeXpecevrgOonk3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667715; c=relaxed/simple;
	bh=v5c1pvEOHzUJCH0jbkI1c9f9EHNSp9tK/WU0TLJOzXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgwqdiAnFsifCNwAWUv1ZODq/vMSrIll3d4uytfSG7rBgAVRwC20L9tC5kbzazmBO6R3fkkOkw2HALkxeLjCJL6Qfv+TZJRNcWZv5i3jM923qGixJOndb0/iQ4Qzo/jmSJkhvw+2NR9TaLkBH1knthhKISRRl8J194HCha4JjIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nhoxjTaw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667712;
	bh=v5c1pvEOHzUJCH0jbkI1c9f9EHNSp9tK/WU0TLJOzXg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nhoxjTaw1gYtbPPeU57OIG3qpgBKd2tWiawhu9a7ldRgDKgdk6lZ9VWva82VnXC1u
	 oVjtcIiFxVGqVPT02Js2h3HK15Xn87gV5v3JILiOVA6khMozQqIm9J8qcuXwg71I36
	 HjOWwimHVG5HAVZzc8PBlj8rJ8lnejrwMP/BkAMOvAtJivyvzIHetLyQj0qKOtUTNy
	 ySLrIAeAzZPwi8GUGSpa73WhZoyicoLpuGkxoEEgdk4HdoHQmTnvOpf1sz0CKF3UES
	 mcz76TBud2bNIn2Nvc7ykSVQThUfrEr8aNUJcNVof4JYtpvqsx1ZRbch2S4t/8i5fm
	 VFcWc8anUpEfg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 70D0C17E088C;
	Mon, 23 Jun 2025 10:35:11 +0200 (CEST)
Message-ID: <b56fc363-b354-473f-b6f4-77accb85069d@collabora.com>
Date: Mon, 23 Jun 2025 10:35:11 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] dt-bindings: vendor-prefixes: add JTY
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
 <20250620-mt6572-v1-5-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-5-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> JTY produced low-cost Android tablets based on various
> MediaTek MT65xx SoCs.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


