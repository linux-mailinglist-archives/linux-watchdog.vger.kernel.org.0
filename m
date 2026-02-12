Return-Path: <linux-watchdog+bounces-4944-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBw/Jc27jWl96AAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4944-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 12:38:53 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7D812D112
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 12:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D00533048B0A
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 11:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8762DEA87;
	Thu, 12 Feb 2026 11:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAiJIWMd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB0E2165EA;
	Thu, 12 Feb 2026 11:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896330; cv=none; b=WwlZ4QeSN+G8Cj5kp1pho6FmZ2fCmKffcfXf5t1bTL4VRnTwd5o7CiE4Qtq0s2BAYJgYLOUSxxJPE6yUoamK6LVjgPhaHFS8Poj9KUWRCAMnISmmF4DiaBokQyHJN2+p0V94ajPV5DwwmteqV2y+rWwf9myG0PsIset8B9M1vDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896330; c=relaxed/simple;
	bh=arLUKyAHRvPe56Ev5yzgeEfNbshDPUKM/yENcqUmewA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MD9dGeVOf+znoblJ+9PrUTTETJrwMSBUSbJFwS5rvlGyZOWCOPMGWikg9Sg0uhMbT0Ti/TgBUueChWowIIljvpMzAFQGiMkWLWihKu2wONjHheACn4Qo/DxsrOWqkqCaZiPtL34RBAvKM9Rf2uMWhREZcNwfU6Z5SdSbCv+vGSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAiJIWMd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002DCC4CEF7;
	Thu, 12 Feb 2026 11:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770896329;
	bh=arLUKyAHRvPe56Ev5yzgeEfNbshDPUKM/yENcqUmewA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAiJIWMdGwqixyrJbqFT6iGQSV666A7TSnXGkmn9TwCoBOj9gImpE8CoT0ZrfioaB
	 XPemdtpJWzXIq9NYJ0ytrpdk2aaEhIv5xv/BQFgveEH7Xdf1y76ruS8zII5FBUGP6X
	 /KQkTTLJUL7gijaMMvqteycmdQWUv8NTrDVZkEgu5ntFB9334aY9Sbt/cZRdakLDEY
	 sTjB8KZ0ZpDZu9ohUp1FDdYt9XsUyvGkcoE0OTKyAzSeTyRH7qv63wxjRnt0C/svuG
	 MyZkBFGumVgONzBdegjlb29GSgUArmloR6ol/iMaZxY06aO/HlaBLPmOqVUZybUMar
	 Zco8WyUKkPpDg==
Date: Thu, 12 Feb 2026 12:38:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/7] arm64: dts: mt8167: Add additional mmsys reset bits
Message-ID: <20260212-flawless-stirring-foxhound-c9fefc@quoll>
References: <cover.1770836189.git.l.scorcia@gmail.com>
 <6f803b6dd1f61728c17afadd2fe983e9fdc0c109.1770836190.git.l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6f803b6dd1f61728c17afadd2fe983e9fdc0c109.1770836190.git.l.scorcia@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4944-lists,linux-watchdog=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-watchdog@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,linux-watchdog.org,roeck-us.net,kernel.org,gmail.com,collabora.com,pengutronix.de,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4F7D812D112
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 07:03:28PM +0000, Luca Leonardo Scorcia wrote:
> Some extra mmsys reset bits are defined in the Lenovo
> Smart Clock kernel sources - file cmdq_mdp.c
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  include/dt-bindings/reset/mt8167-resets.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mt8167-resets.h b/include/dt-bindings/reset/mt8167-resets.h
> index f77c2ca897cf..b379f8f023d5 100644
> --- a/include/dt-bindings/reset/mt8167-resets.h
> +++ b/include/dt-bindings/reset/mt8167-resets.h
> @@ -33,6 +33,15 @@
>  #define MT8167_TOPRGU_SW_RST_NUM		15
>  
>  /* MMSYS resets */
> +#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
> +#define MT8167_MMSYS_SW0_RST_B_SMI_LARB		1
> +#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
> +#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
> +#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
> +#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
> +#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
> +#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
> +#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8

? You just added this file in other commit. Don't add half-baked
bindings/code, but complete at once.

Best regards,
Krzysztof


