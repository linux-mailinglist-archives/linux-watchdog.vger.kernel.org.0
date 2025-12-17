Return-Path: <linux-watchdog+bounces-4706-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E5240CC5A8E
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Dec 2025 02:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF98F302E59B
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Dec 2025 01:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910982264A9;
	Wed, 17 Dec 2025 01:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y65tX+y8"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622D81FC0ED;
	Wed, 17 Dec 2025 01:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765933295; cv=none; b=iHLojJjazmjasGZI1bDl0hSqFHF/EGvCE3m8DmZnPP71wI4WebdfE0faacLVPuGu+WatGIlbWoumh6Mfw4hDvtnlnnFF1QxFQin7yCaG/wW6xt9u0bSXQNU2UC6qaf+L3XQx/mGQgsTVRcaeC0k534WUpf8eag7M2pePkQaEQ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765933295; c=relaxed/simple;
	bh=8ogmzsaaZydM9HtC9hg4iWRJ3PUwmjx5C7NXv5+fNAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jz8COIoXu5lxinYktna9+I5Fm8kZ1/1ylxI/VXy7KFkcfSCjOHpzpsBoaEp7PX7D9FtqXyHey5R/GGkIX8syldj+0IsoFLLxJxbIICJnNfui4yuFCldCNka/d0qo3YHL4R0L5/FbZhysJ6pUKlN7E/VcopScZb2YjTutgGN91xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y65tX+y8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1893BC4CEF1;
	Wed, 17 Dec 2025 01:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765933295;
	bh=8ogmzsaaZydM9HtC9hg4iWRJ3PUwmjx5C7NXv5+fNAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y65tX+y8QnKlf4UvXKVtfa00DlOrBh2wdVZ5NqA/WLp2/cHfMKSwBvleFkvZzP0z9
	 fX5zOjlNONaLjgu9tJIf4CEC+rgHsrKKFqIacMW4H/xVujADoeMpMW4Wj2M8f1Wxnu
	 G8bM8Of2tzW3SZtKzkqu48RG5tFUz/aGP3r47IV0tUp6a/muur5fentRBEOM4+0uEr
	 bwM/UU2Z84uaXRCDu8u2nlgC3A3AKig69TCSWLaXbvDaxGerz0+Qc7APhfNhRwD3Dj
	 7YPaoDaFmaRQNQ5E9UdTp5Fp9iY4A8WldQQuRhRwDa784PaENhb01Hbb/qjcfhLk3N
	 C89k1XSkfJXTg==
Date: Tue, 16 Dec 2025 19:01:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Document X1E80100 compatible
Message-ID: <176593329281.3467675.3866097981063853204.robh@kernel.org>
References: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-0-94ee80b8cbe7@oss.qualcomm.com>
 <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-1-94ee80b8cbe7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-1-94ee80b8cbe7@oss.qualcomm.com>


On Sun, 14 Dec 2025 22:49:58 +0200, Abel Vesa wrote:
> Document the compatible for the X1E80100 platform to the Qualcomm watchdog
> binding. The HW implementation is compatible with the KPSS WDT.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


