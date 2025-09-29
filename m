Return-Path: <linux-watchdog+bounces-4289-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53614BA8DA3
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Sep 2025 12:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C855D189CE74
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Sep 2025 10:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1FF2FB97A;
	Mon, 29 Sep 2025 10:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h34c09nJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A892FB61D;
	Mon, 29 Sep 2025 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759141019; cv=none; b=e4WWkqIa1jEDx8R3L1v58U3vKqBGUwal28TOJv01yrHRKpmGC3sjk0oVTJ+fimqu6mEt8eEAz0WhqxmOFYJ5swuFfHPxwt+jx+XWy8btnIMSUAYLhN7/i6W5mvl1PMYZ8cV1MRaVUKKdxd3eVWehEKEoRTEcaUOlqMWPh2G+pko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759141019; c=relaxed/simple;
	bh=gFFRfxU0C4D89u0f4bM0By/gaq3tBosyxmopf1mr5K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=twpW4OSVcxD5nDDckk2XyDOEoG8J7m3ZIOblFsIlCrV0ZjWNeRZsZ/2KUjrxgEI8VK242hXuauq/8sGA1CjKnZ6EM40ME5jyc1Q3jfMybJVVFR8DRcvJRCvVYzPR+rC7OPLnWXJGYqA4P1bb0QPWoGF+prPKYFFchjpi120mHWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=h34c09nJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759141015;
	bh=gFFRfxU0C4D89u0f4bM0By/gaq3tBosyxmopf1mr5K0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=h34c09nJnODV8gvef0KmprNLPW3Zw3bVD3YAxen9qwBKeVY8tmInOKqqP9ecxW3bD
	 qfIJFLAQQUMer4lcfscKlfJQ4jtWBwvCXeknCjY9kHj+8PGlqQZR85UkVpc3GCXXfU
	 er27tuwf8YfMdPcZ0fsMcjyalysTZlq5BzLGgOP2a/usa5Srp934Jw3qxMBcjKaGJx
	 G5sSKkmQXyImv3XcR//ErA4gx3f44M+l91Q0wA7ZfW8pSkJMLDY1M/2PpNWnb9oP3g
	 HDHUFe4WrZ9s78gSuOUiMmJgobh4VPgx//jpQRzJraSfhQlv8Wq7ClobVcBqGwjWdt
	 q4c1BE7rIDYAg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 83A2A17E108C;
	Mon, 29 Sep 2025 12:16:54 +0200 (CEST)
Message-ID: <d02f8264-e437-43d8-8d4a-215f2154ea15@collabora.com>
Date: Mon, 29 Sep 2025 12:16:54 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: crypto: Add support for Airoha AN7583
 SoC
To: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250925164038.13987-1-ansuelsmth@gmail.com>
 <20250925164038.13987-2-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250925164038.13987-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 25/09/25 18:40, Christian Marangi ha scritto:
> Add compatible for Airoha AN7583 SoC. The implementation is exactly the
> same of Airoha EN7581 hence we add the compatible in addition to EN7581
> ones.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



