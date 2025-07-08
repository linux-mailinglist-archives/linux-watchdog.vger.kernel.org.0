Return-Path: <linux-watchdog+bounces-3840-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4479AFC608
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Jul 2025 10:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDB2018997C5
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Jul 2025 08:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1C62BE7C8;
	Tue,  8 Jul 2025 08:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPmTO5aF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE81E255F25;
	Tue,  8 Jul 2025 08:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751964225; cv=none; b=dBb1OyZj/Pq6EGz6+excM0F7MSHfEbxBkRY/1wjni4Dr3S27IG1O9ckci35+6A1m00sK3TOe53aNvTu05FjIZrBtRIQNbYYRzSL5SG6cRlaGt6MYDXX5TCXLQtw7b45N1XXyubXeiqgLAG0N32uEEcNiCFWhB7nDj6akT0mmHB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751964225; c=relaxed/simple;
	bh=XnfttrWEHe9q4N1bxzzh3vjDPTGsPFpGOyNYE/K49pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHeoOK3///Ryeagn5E5YsspVPSOQ+UUbmTXLkuff0FtunaFiSugjnmMhll+Im3Cvap1rGYdXwusr3m1Iu9KCDh8T4mG/hzZcbkoRlfkPjtKyFw4c46G70qw3Rr7DI1b6Tpfv5XYpnXWXliZxc+7kYbdO6cMgGOhck7JVrVV4usg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPmTO5aF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE8EC4CEED;
	Tue,  8 Jul 2025 08:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751964225;
	bh=XnfttrWEHe9q4N1bxzzh3vjDPTGsPFpGOyNYE/K49pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPmTO5aFIFLjqOh7tg97OaCnmDMoqxPqty7JR7vY+QIPi1heUnuB1cYzrZb9OFGJ8
	 Z890jZfXhnB23DRu56LputxbzbKStacAZEM2nqgm+/wNWBNltcDlQP7mfvRcA1Kadn
	 m4MGQP+fqCft+qa1fdVLqiROEofKJvWjEgGXWET3/+99RTEO0exRyRC92kmSp/PLmC
	 sKF5FvgnaGk8L+pP67xf3G2gF1LH1VkfnacNvNq7eMc5g4W9BNkstPNY1aMfqHMRn/
	 ybEevmxx/fFwhbC9demd4yDstaF7ivr8ajkLGe+LSVpaPIbag20TUugcw/8jUJGygi
	 9XLmn3X7Q9aPQ==
Date: Tue, 8 Jul 2025 10:43:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zexin Wang <ot_zexin.wang@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: mediatek: Add support for
 MT8189
Message-ID: <20250708-aspiring-evasive-orangutan-fa7b74@krzk-bin>
References: <20250627094431.11772-1-ot_zexin.wang@mediatek.com>
 <20250627094431.11772-3-ot_zexin.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627094431.11772-3-ot_zexin.wang@mediatek.com>

On Fri, Jun 27, 2025 at 05:44:20PM +0800, Zexin Wang wrote:
> Add compatible string for watchdog on MT8189 SoC.
> 
> Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index 8d2520241e37..ad69bd28ac9e 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -29,6 +29,7 @@ properties:
>            - mediatek,mt8183-wdt
>            - mediatek,mt8186-wdt
>            - mediatek,mt8188-wdt
> +          - mediatek,mt8189-wdt

So it is compatible with previous variant. Express it and drop driver
patch. Your commit msg should already say that - describe the hardware.
Now your commit msg basically duplicates patch and subject so it is 100%
redundant.

Best regards,
Krzysztof


