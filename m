Return-Path: <linux-watchdog+bounces-3700-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C2AAE387A
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 10:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFB9D1894AB7
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 08:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EBE230BCC;
	Mon, 23 Jun 2025 08:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cgBalYUo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DA222FAFD;
	Mon, 23 Jun 2025 08:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667713; cv=none; b=Pq6XyphnYQ2MAuA7GP6TDUwpqNkMvDizV2XXm7XV18e0A/0ux+W55IacS3vxjMQZvX82xgWDW75B0ueWwH1AvsmyhvFAbN6VUKufyYljH2QTfIeO5fYkhwPDlozuQspRauOHjImkeESR9uCJmegMl9mG0DamdgCyWEZq3Fn9n00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667713; c=relaxed/simple;
	bh=35i94WQPeCQMWaQEOF+6oteQPVu3yuDJq4zvDX2DSKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bT0Wek0AAaddBVfgaqPkKD/qXop0/AHopthvNfo9z6jN2W/Yy01Dn7I+FIN8VXnF5iPkuz8AmtNAT70C1puZmCVIN1raQgwYP/SlBxKm5cUbBBFmWyB3Tnw9L7WUthAYhs091FQLe5Wx15tRIMBvlyv4EteZlbjbJ/NCgJG/S94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cgBalYUo; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667709;
	bh=35i94WQPeCQMWaQEOF+6oteQPVu3yuDJq4zvDX2DSKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cgBalYUoaAz+rwdk95p5gTmgaJPASLpd6yzel1ek4h2zrXaBTW980IpLM+rEEnq9d
	 orgAF14zmcpZ/WHYedyv2OZrP2h0sieF339FpARklvdVoLW4+Q+ZT9Px/9HjPT/K9Q
	 sWPIE/aeTLpYsulMmm5JnPmqN0mrJyFmQ1ypluEBKlKPZGAY8l9/UoJB/OQUhuc1E9
	 ztcnTt/dner+0C3KhloZuOuJssHjd8cdkuWRweKRBN8JJbXvMgm9XVZiLOa3mg2ZKJ
	 sePSWI2TZAtXVtPTG1S8S2i1711g6+dmNTTwoS54KZnx246KcnRxOXAsgTErxg5VnZ
	 JLPeudnHUu4fw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F03FC17E017D;
	Mon, 23 Jun 2025 10:35:08 +0200 (CEST)
Message-ID: <28085813-5b29-48af-8e54-5bef41ff659e@collabora.com>
Date: Mon, 23 Jun 2025 10:35:08 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] dt-bindings: interrupt-controller:
 mediatek,mt6577-sysirq: add MT6572
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
 <20250620-mt6572-v1-2-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-2-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for sysirq on the MT6572 SoC.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



