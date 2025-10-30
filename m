Return-Path: <linux-watchdog+bounces-4455-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D975C1F66E
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Oct 2025 10:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 42F6D4E8B29
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Oct 2025 09:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D5134C13D;
	Thu, 30 Oct 2025 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aepXyd1+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A98C313E0B;
	Thu, 30 Oct 2025 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761818178; cv=none; b=XIoIT7EPJ/jo7KsO4VFCkzQy1PFk5ZXTBQxKJ0HhnEHrvXrSqUHgt4TXPqm+svX5/1NryCfjqupu+eIdN0p0ynkoLwybDEu4cbYedkckHN45Bxq+9R8oFLe2nk+Z5CSV4kKjdXUmt2Z6ZmtdqEoOUmQ2TEkd7s9d1On5HjgN92g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761818178; c=relaxed/simple;
	bh=WvybbrxQC7xpFEbmIAT4BCpykfs8com5ayDGPmW+4Gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FUB6rcUvSRAtRVoVaioXcBZQaZFP6qXffeSffuwrGTFbEcce7nBuTh8o+zUH64C7vSIbFyO4juXYrRBPEWQ5nbP0Hq2/ub5EPUAy2aFuKt5ryZfUnrJSTZbnGMK/RX5PdJZ5vwBROFw/uL4GSn+bd9N1hY//nbFs63AKm0iHCq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aepXyd1+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761818174;
	bh=WvybbrxQC7xpFEbmIAT4BCpykfs8com5ayDGPmW+4Gg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aepXyd1+E9wjCTbPm8FjKmWX5cbmUEfZepgfuu7m775MvfyKGxj5t3biFLJUhBsaP
	 BlI4hnGsGmz4KBUC2HL5oKkQdZgI80XiqUTVVTk8CRCx54/5I1BeQXWmMDDBau+02m
	 QmkULgfO2DIAZVmbphGwIjQZilrt9wRtNPbvAqowH/OTrzp7nodJoPfXSPMqNkq73N
	 fTbFNqTSrs4CxUR4KcBDsmGWAufjQjENajbIPzujuECyCrh8/HoXJbfYVW+qFLB4XZ
	 XlPMGEpyj2iHq8znx1U0t0XUbg4Tth0mgzYkzoGUZlLdrRMNHzANo4PzvSk5KMK7UY
	 On9+nctzT84TA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 289EC17E009B;
	Thu, 30 Oct 2025 10:56:14 +0100 (CET)
Message-ID: <51705227-9172-47db-a9b3-3c8ea3fa5338@collabora.com>
Date: Thu, 30 Oct 2025 10:56:13 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible
 for MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251030-mt8189-dt-bindings-wdt-v1-1-975971ba29e5@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251030-mt8189-dt-bindings-wdt-v1-1-975971ba29e5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 30/10/25 08:40, Louis-Alexis Eyraud ha scritto:
> Add compatible string for the watchdog block on MT8189 SoC, which is
> compatible with the one used on MT6589.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



