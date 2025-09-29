Return-Path: <linux-watchdog+bounces-4290-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCB9BA8DAD
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Sep 2025 12:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5749E3AFE0B
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Sep 2025 10:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBA52FB99D;
	Mon, 29 Sep 2025 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WUC9/Ngk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AE92FB963;
	Mon, 29 Sep 2025 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759141020; cv=none; b=WVnNjKCbnF7zexNCvb6wGcoMA8uq3X2cHoEd8E3WFYw1+E4QHnYOmA0X9ppwAYAm1a6y/841w07KpDf+rr+j0YmmDnW1ay23M0eHK0L0J+DRWftrudrKglbN57o98Da0LMnsKf04LV0gDQ8Rs2V02mD8fk4z79ZTKpZ4CjBC4JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759141020; c=relaxed/simple;
	bh=gFFRfxU0C4D89u0f4bM0By/gaq3tBosyxmopf1mr5K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ba6an36dbKpMVpupIuWFAx93lfNl8Vrce6mfIyl+VHLLmHGSoyT25PvYMRhBjtJA9AZh+FBMjq9EvBOZuvV69L9zdke5Z1LYWBpCbPdeK4qnS6U6gAcvR80VIOaDgq/9RRpxpVVJbD7jDhCg5zJUVxWqA5mTjV8HOqNnx7/yzW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WUC9/Ngk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759141016;
	bh=gFFRfxU0C4D89u0f4bM0By/gaq3tBosyxmopf1mr5K0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=WUC9/Ngkd/07HEYXLlEz5Yi8hfBjhKsC56RBiI1T79cwtzQl3n2eAdJtoeDBH81tx
	 X13ajlzJrgwkByssvOjhrwIYh5WHSGtGWr9GIJ7G89KUEoDn2GeWdhGEWJ1x2wYD9H
	 kloSZSqhs3xnujYQmwsRIhN2+lR6y1hxVAulKUFER2QVWXd22+Efk4zHvYMf4QO9sY
	 C5uufMLLl0is97pZZOE5J+40teVdC6mtumDIT19WLo5JZ8N8cERaVtR7hSml5AQOwO
	 11c62ZNviRXlS6gYLVdPyY1reA2kxy9SQeJkncIoz/AsegSWqps2+Q10QmKhyu3QLx
	 RShiy6FC+eB/Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A7EA017E12E4;
	Mon, 29 Sep 2025 12:16:55 +0200 (CEST)
Message-ID: <8780b731-950a-490a-9dd9-7ec916e3f992@collabora.com>
Date: Mon, 29 Sep 2025 12:16:55 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: watchdog: airoha: Add support for
 Airoha AN7583 SoC
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
 <20250925164038.13987-3-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250925164038.13987-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 25/09/25 18:40, Christian Marangi ha scritto:
> Add compatible for Airoha AN7583 SoC. The implementation is exactly the
> same of Airoha EN7581 hence we add the compatible in addition to EN7581
> ones.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



