Return-Path: <linux-watchdog+bounces-4334-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6C9BBF9F6
	for <lists+linux-watchdog@lfdr.de>; Mon, 06 Oct 2025 23:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B6CE3A437B
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Oct 2025 21:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DAB51DC994;
	Mon,  6 Oct 2025 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t9TeKt4y"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA8238DD8;
	Mon,  6 Oct 2025 21:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759787848; cv=none; b=uAsKCTmDfdZx/jSwcskKEIm6gARwVGl9HTXjK7EMKw6YgsJUipmnCsi0t7aoCxCXD8nIuGI0d2D46XkL6DpjUDUDnTCWF5WHfU0JVdhtHwldffC67Xeuka/QwVuJ2UzqP8sLvoZaxd+lWEcVs8E0L61pTLEcqJg5/YaAcmQctQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759787848; c=relaxed/simple;
	bh=oC0jqHVnHIvEcTI9DKySEPRWFpYU6+vKH9z1AzExQOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDfRRbn/aho8jBkF4MiAo6knVActDQDhzsRiFdM96Uv8SC3XZ6o4ZiADEICQHIrrCH9PjDXQHWlQ8zuFyh0zAM+9CvPvRKkiBnqZ/jHdcsYTTlzvpfWI/0d8C2vyBnKVwEfzNFME6TT+3slEIgkbFSMozSSjC+9XmgSQuPllRZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t9TeKt4y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D717C4CEF5;
	Mon,  6 Oct 2025 21:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759787847;
	bh=oC0jqHVnHIvEcTI9DKySEPRWFpYU6+vKH9z1AzExQOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9TeKt4yls+RcjonUeLIfc4nzq9BpZ/xAa4Tsum8c84bh+xiKAn+qAk+9ySOO5m6q
	 yeTdAULdjrDiHQ3LH1uPvLJOhDQH5uKcpgLsy/bu8Rcmo8sAHVH0UXJkeXz6uV+EIV
	 LC7oMdtcdrdsDSnsh4zBLk/c+oEwO1H8zN2/jRzIGhsW9C+MkQE3u5lXlwn8d8Q5yH
	 tyu5WCPqXkEnASGPZ+KEcQ/PCHhHF3BniA6WLJqEdVOnG6pSAhNTWAcmKIt9synyeE
	 KgvAwmr6oSGz+PyfxsaG0U3W+1m7K0F9z0MUqO3GoXwhkiy6SNZYhG1Y1P/Jq18YIe
	 l3TAez9/04AgA==
Date: Mon, 6 Oct 2025 16:57:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	John Crispin <john@phrozen.org>, linux-mediatek@lists.infradead.org,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v4 1/4] dt-bindings: crypto: Add support for Airoha
 AN7583 SoC
Message-ID: <175978784599.652158.16607714695009330937.robh@kernel.org>
References: <20250929114917.5501-1-ansuelsmth@gmail.com>
 <20250929114917.5501-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929114917.5501-2-ansuelsmth@gmail.com>


On Mon, 29 Sep 2025 13:49:12 +0200, Christian Marangi wrote:
> Add compatible for Airoha AN7583 SoC. The implementation is exactly the
> same of Airoha EN7581 hence we add the compatible in addition to EN7581
> ones.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/crypto/inside-secure,safexcel-eip93.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


