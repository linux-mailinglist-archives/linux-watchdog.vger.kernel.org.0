Return-Path: <linux-watchdog+bounces-3759-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B14AEC1F1
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 23:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C7F6173C33
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 21:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2E82737E2;
	Fri, 27 Jun 2025 21:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVbXRiBa"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BB9270547;
	Fri, 27 Jun 2025 21:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059380; cv=none; b=iMqn8eUnPDeL+Tk5hy084Bl+zocy14T9Y/WYJshxBtZNybyJ6pr/qgnPXQnP6Im5A4RKXIPGVwuYp7GL14auobpPAibBjPcKSKu889O/kjnKCwmsL72LCIucxLpEBHLztSDb2d+LKPw7j2UFRjcFTsS5+nKiBKTnJq4/d7jeFds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059380; c=relaxed/simple;
	bh=4kv5wxyDcd8ccxR2sHbhKnL/yZ6+0PwtOkGdcdzU23Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXQ2jr7sc3+1v0muIs8DA92n73cbPhO7QBxK6YxjW8pd9cnflKxXCJL1BXEDXvEf8gZYx619jcvh4Bf/ej4NSFP6sNszdPaYJl7rPIdlSxX5eK3FmImeByi+bYlY+ZCGodoYqe2bH51qiz2KIEv6Y3H1q4hnJF2LdJ9qMPm08xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVbXRiBa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD704C4CEE3;
	Fri, 27 Jun 2025 21:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059379;
	bh=4kv5wxyDcd8ccxR2sHbhKnL/yZ6+0PwtOkGdcdzU23Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVbXRiBaKTezjZCqKRnYofdLdMXAHITbVsU4vgkWepM7Jz1xr2LC5z2GWcbxnAhOt
	 P5aP7fqWMcFrNSh1zXxe94Tb3YqnXUuJFPxEa+j0fXKf/l5ZT20A0PUfyVe4TPmPpo
	 vi44C3dTa4O3yf7RrjPYn+qZnIhKixfgX0UwsykhEfL95g+98OEGL59iYBpv+/EGxW
	 tSRtKuXhARnTZlvBUlio3k7wCsQICKsIt5Xcz/8rgoz6cu04skDq11LIHL69ERJeVK
	 kd97wIPH/Em6sO6QixfTDDHctWcOaXNbUAYpelxdp6DupvoSbUb1iW/hT3wl729PSV
	 WrYuCXuUm3L5w==
Date: Fri, 27 Jun 2025 16:22:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Max Shevchenko <wctrl@proton.me>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v2 04/11] dt-bindings: watchdog: mediatek,mtk-wdt: add
 MT6572
Message-ID: <175105937841.166232.1267784883426829813.robh@kernel.org>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-4-f7f842196986@proton.me>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-mt6572-v2-4-f7f842196986@proton.me>


On Thu, 26 Jun 2025 11:53:57 +0300, Max Shevchenko wrote:
> Add a compatible string for watchdog on the MT6572 SoC.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


