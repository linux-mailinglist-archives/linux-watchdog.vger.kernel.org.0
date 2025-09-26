Return-Path: <linux-watchdog+bounces-4285-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 844AABA44E2
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Sep 2025 16:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E8307A5AFD
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Sep 2025 14:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1CD13957E;
	Fri, 26 Sep 2025 14:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VsIMOILF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D36B38DE1;
	Fri, 26 Sep 2025 14:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758898542; cv=none; b=SvzVWUObue5LcPuRr31s+8OISdV8tmuNCpKIn00kvsg4TQwc11lSQNBjs5BLzqVscYFHMtJzgG8i1St4gNm+rNfEUh1wBRWjV78+YY5WD6/2CLApxrwXbHJiaqAbKWRKbKrbCO52wFGV7DY4B3GnHod3rxGHEpB/TPLle/nbtng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758898542; c=relaxed/simple;
	bh=8gj65qVHmn8vegx9eirL41njLH2RQUiHZwCiJ5RZXJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=giW1UKH52GJgxyJoWbbQ/76NxQAjlsoP0GPE+PcktKVUz0LnEnln6VblLSlNPc5PPUlzpS7V58gH5wwmZZqfipIiDK0lhK00Fn94Qn3ijsOaiYuwazoFVwrIc6PX6oThLpoc/9e1IbaAeg2C8yDORgYcGF1y1QFOAx+42tmk9t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VsIMOILF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7740BC4CEF4;
	Fri, 26 Sep 2025 14:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758898541;
	bh=8gj65qVHmn8vegx9eirL41njLH2RQUiHZwCiJ5RZXJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VsIMOILFvZt3zXiMnd+saoKFhSWh5zztX+Vkpu8GCGi2SCm9njFLFhSnDPSmZNwfv
	 SYleGKAfg2B6nSMO8jJOkRwZp/YHbS3Dr++PLIQK9xXPglOmsI0R5WQNP2dlWAPC4M
	 CeYuH+O4NbFWXni5LxPXR2/gc+hdGL1MGw2FeR0+dBAJxE0z96ICowzveFhLAzoCCQ
	 caFPk/ln35737kfe6I5VenX7KEpnjhPImpeJLdZsFbaPNnPu1+BwId6SjWg1PLHdN6
	 XmdlDWwHpw9tCsGkQIr52V/rybBVS936X3o7QcSxbt5TXrYmxM61F4u9YpWu1twaIP
	 71oqhq8XgRDeg==
Date: Fri, 26 Sep 2025 09:55:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	John Crispin <john@phrozen.org>, linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Felix Fietkau <nbd@nbd.name>, Conor Dooley <conor+dt@kernel.org>,
	linux-crypto@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: arm64: dts: airoha: Add AN7583
 compatible
Message-ID: <175889851158.762885.9694825397072529711.robh@kernel.org>
References: <20250925164038.13987-1-ansuelsmth@gmail.com>
 <20250925164038.13987-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925164038.13987-4-ansuelsmth@gmail.com>


On Thu, 25 Sep 2025 18:40:36 +0200, Christian Marangi wrote:
> Add Airoha AN7583 compatible to the list of enum for Airoha Supported
> SoCs.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring (Arm) <robh@kernel.org>




