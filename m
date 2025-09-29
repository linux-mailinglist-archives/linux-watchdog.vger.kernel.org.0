Return-Path: <linux-watchdog+bounces-4291-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 527BFBA8DB8
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Sep 2025 12:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD620189D189
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Sep 2025 10:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A6D2FBDFA;
	Mon, 29 Sep 2025 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h8f51fsB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358432FB97B;
	Mon, 29 Sep 2025 10:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759141021; cv=none; b=sgUDgZPwOxkD4ap3IB3oajY9Wtb++OLdhxyLuZJU4jhvnw3Wy6Ugfqqy8pCLeGrDuRxKMuUti62qhH7ybPdmzWwn7qT7f2Gx4NbnVDodnWtzan3CodC4C4J0ix7S10rlq8Q13Ta/ioQsS/tMcVFBCfnijF2/kX3iurkir1HUOg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759141021; c=relaxed/simple;
	bh=f/1OQ8c/GwYQsJs2PTABxuE9dPKn0z3P5+u3vtzOc+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lxFTPq5cWKl7wSKwx1IBnmdBQIDZqivHkEXSIzUrbETsoscwUjDx9bJYzze7QZWJKIRw8sPiP8/rAEkNwFxBQrN0abg6cwK+yEjsxuAmZMBaPUVPk4CEgIOUIPV0XJxaZlYOegRx6EIaDuXAjb9Imrc51YqfoaR4851pe/rXQMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=h8f51fsB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759141017;
	bh=f/1OQ8c/GwYQsJs2PTABxuE9dPKn0z3P5+u3vtzOc+w=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=h8f51fsBhnrIl9AhdurBpnywg7Cjn+965XIxuTAQPShRk6hebrrHEA2WfujwGaoCq
	 qE2UJuWmNoSCaUPbR1kslC+/WvS5NkOHjmX4EMQeJKK10K1n5FLdH+lo/61T6hmdxu
	 linoFifW235JxejaxrjLjg6xpBQLmeXWqJCqmQzQyyD0FECq+IrD1yvGYkrCrSgHEJ
	 cceONvKGu0ky+24BcFZVksh2q8Hs+N07wgWqUb2ulMu+Ga2YExkHchWevtiKeg/sL6
	 ieoxgtlai4IsADMLDwdphsIha4iEaxjOQbIKfwBttOoxSPMAYzij1m6FBaLbCybmrB
	 FeZEAFtO0wv0Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CBF4E17E13B8;
	Mon, 29 Sep 2025 12:16:56 +0200 (CEST)
Message-ID: <48940f1f-520e-47fe-8f6f-2a9d852f80bd@collabora.com>
Date: Mon, 29 Sep 2025 12:16:55 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] dt-bindings: arm64: dts: airoha: Add AN7583
 compatible
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
 <20250925164038.13987-4-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250925164038.13987-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 25/09/25 18:40, Christian Marangi ha scritto:
> Add Airoha AN7583 compatible to the list of enum for Airoha Supported
> SoCs.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



