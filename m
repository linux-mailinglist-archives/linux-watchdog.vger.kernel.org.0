Return-Path: <linux-watchdog+bounces-3765-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F73AED5F5
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Jun 2025 09:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AD751898E84
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Jun 2025 07:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7020D22A7E9;
	Mon, 30 Jun 2025 07:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gr5NT1if"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC7718E20;
	Mon, 30 Jun 2025 07:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751269208; cv=none; b=YjBGyLDCfUqhZy679tpyMve/NJTO/7/ZF2SNPKRfP4J9dC71D4MZYUmvbzXfeoLH4281o8JyOPQNQFzZC6stWmQwj3fblWqyygKZ/6d3hRGbAskZ+mjdr/v/DBo3hrGkbbebF0z//uNprh8E5t9/mN4VN1LRZpogQX8aB55fKK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751269208; c=relaxed/simple;
	bh=iH1qk3TEX8/F3Emk7ZAE9XR+BHZMvxK9JDSs6Kw85jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YtRadvtozdV9PQOPkiyWUucAeh/gbOEOxj1o40nQDsw9kpMNHCaZh7pvyqNZOaZ2p7DtPCG3yeQjgmH+T5yy2pb27Ed1jOOzUz2RepUmcnNv0SIwBtvrovxMwmO71jMsA0/1UHyK6usXOhMNHY5b6S5mncLzwh6Vead1/QSb2Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gr5NT1if; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751269204;
	bh=iH1qk3TEX8/F3Emk7ZAE9XR+BHZMvxK9JDSs6Kw85jc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gr5NT1if6XlCE2qsdH9o0xepxlYgTTZ4D/QniOhC0dV3fBtRw2Z2dgnCV+3z1DPeK
	 AnyCSJ0TME+k1kBS6+GBAtc0LhBcpvltE2znV2MYcbk5t7KO5evyGZ/Ur5OkJH8Ou9
	 Kn/ciSR8yQUnQAPVDNqgckO2/YdiYNVQSODq/DU4gGCXkNl9u+f9Iib5XPF9KlKQAY
	 5JXxy/yZZk0M//UtjclBY8vlpg26YjMXnZ7mp0fNKRmOgrNVQrdjuZrtxTE2vrR57i
	 p4JJFRlKQ8CoUc5814rgVPAPjtZuw61FmRSRLMYv//7Ncxr/tFpaVTFIuV/0OaBRza
	 1T4CORk31jDRw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9D0817E0657;
	Mon, 30 Jun 2025 09:40:03 +0200 (CEST)
Message-ID: <5177a9cd-7ba1-4697-89a1-1ecae7b0a28a@collabora.com>
Date: Mon, 30 Jun 2025 09:40:02 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] dt-bindings: serial: mediatek,uart: add MT6572
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
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-1-f7f842196986@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250626-mt6572-v2-1-f7f842196986@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 26/06/25 10:53, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for serial on the MT6572 SoC.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



