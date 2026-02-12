Return-Path: <linux-watchdog+bounces-4938-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF19KnGjjWlh5gAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4938-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 10:54:57 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D34A312C12F
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 10:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63CB531498DA
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 09:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C132E7BAD;
	Thu, 12 Feb 2026 09:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KgerlAYL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1E32E4266;
	Thu, 12 Feb 2026 09:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770889958; cv=none; b=U3P2H2e2OMzUGoqAlDnve9Wswhgw/ZbHRBTPQmlo9GIdYeMQ2L+BH6S+JU9io+YlTHBXbWqT9KtsabjSbybIeDzeK5YtNld3nGgWhMWq9/DeAcGP8bswqkPGvsU2ELNxtYN/WTZyioA7TYkD+QCnMahzpzVJWc0TWFClG7dj25Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770889958; c=relaxed/simple;
	bh=rcGXULORsTJ5y5lmca1iSvmzehk/aYsFmrEk4qqmX7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXBdaVpnoo4cqBH2gcbUwiluopKOHA6nzUBHG/Bh37yTsarsV6gDJzS4kws6SlLp1OjqNNp1g/8+iqsueDgiVcpQVbYSi5mfr5knYlOZfW0zo0zQmCmtZp/PlYGzrfwZVtaarKElnqmDMhGhkEmSM2DrDWj6t8nqNQhjjWeCbc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KgerlAYL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770889955;
	bh=rcGXULORsTJ5y5lmca1iSvmzehk/aYsFmrEk4qqmX7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KgerlAYLA3xSJx0db21DfPBrLw2unTaw2Kzoi+TXiQt4NHVNpVrdnmEaaXLUX89RQ
	 aAZX4HVsq7u9/7ehv2ITidjDbTN8/b/uGazbWpV7b+mF50JqifGhNUA8tXY+lYQzEt
	 aBaviatdEU6Tnf5f1B3s237GaggtqoHUJ/eNRtG+YcdrpJbHSir+ZG+8kq35MwbM1x
	 rcOkHMRg058tn7rNG2XNTD9hPkKNv59q4hhLWsphZo7+Vnm0LpOwvVyL2WZcmYfSXQ
	 L94zOjsXKw51DhbKodInm5PTlGd5QpkoJH3BeIYBYcajTwXL317YgKBVJ/oXo5X2o7
	 E8TjlU5Q65C/Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F41C717E1532;
	Thu, 12 Feb 2026 10:52:34 +0100 (CET)
Message-ID: <f37e4842-ad39-4529-aefa-eba16a28d7ee@collabora.com>
Date: Thu, 12 Feb 2026 10:52:34 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: mt8167: Add a specific watchdog dts node
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1770836189.git.l.scorcia@gmail.com>
 <228e74cc870ac01b223875e2a0dd7effa4137213.1770836190.git.l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <228e74cc870ac01b223875e2a0dd7effa4137213.1770836190.git.l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4938-lists,linux-watchdog=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-watchdog.org,roeck-us.net,kernel.org,gmail.com,pengutronix.de,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.152.177.216:email,0.152.173.240:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.152.220.208:email]
X-Rspamd-Queue-Id: D34A312C12F
X-Rspamd-Action: no action

Il 11/02/26 20:03, Luca Leonardo Scorcia ha scritto:
> The watchdog driver for mt8167 relies on DT data, so the fallback
> compatible mt8516 won't work, need to update watchdog device node
> to sync with watchdog dt-binding document.
> 

Sorry, what are you talking about?
You probably forgot to update the commit description after pulling this
from some midstream tree of yours ;-)

Please update the commit description.

> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8167.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> index fd17daa13dba..caf51f203dd3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> @@ -48,6 +48,13 @@ apmixedsys: apmixedsys@10018000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		watchdog@10007000 {

All devicetree nodes must be ordered by mmio start (when they have one, or by
name when they are not addressable).

In this case, the watchdog node goes *after* the scpsys node, and before imgsys.

Cheers,
Angelo

> +			compatible = "mediatek,mt8167-wdt";
> +			reg = <0 0x10007000 0 0x1000>;
> +			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
> +			#reset-cells = <1>;
> +		};
> +
>   		scpsys: syscon@10006000 {
>   			compatible = "mediatek,mt8167-scpsys", "syscon", "simple-mfd";
>   			reg = <0 0x10006000 0 0x1000>;



