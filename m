Return-Path: <linux-watchdog+bounces-3036-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F85BA4A41B
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Feb 2025 21:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DADBC17789A
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Feb 2025 20:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBB923F397;
	Fri, 28 Feb 2025 20:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qtrc9H1o"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C46123F374;
	Fri, 28 Feb 2025 20:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740773858; cv=none; b=MEgT6vl2f0VW9JiZI+apH3CiwLnMMdZ9ZzyTFBwl4zrNaaDFfiKQLeFY7qivT0oFwaQUCOsbTl+uVRPfM0CJODw+eZOoQ58pqxTjI/weOhg7Xa84MOYje2gnePHKuG6nZnF8xLSi3Lt8FFDs/tpcXoPvqkfEKvud3chX68QTOwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740773858; c=relaxed/simple;
	bh=6KGthV4tzaFDj3AdVqt3lZ1JPdgm3iYGLTVOdGvXUYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWewOv9sv5kt1MXy0mBYY4g+NIqEoZ+odrQfDIaiIFfHcoc3Vh+Za2upDzWt+k86Pnuy0/JhDnb+cWYzuXYO5K3QsL5qIQlAOH5YpBf+VufPyF9cm/056sR1xBopw5Xwf0SMQsh0ntKNg7J5BZZj8yl3/H+zldezh6TLxe3nwXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qtrc9H1o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C244AC4CED6;
	Fri, 28 Feb 2025 20:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740773858;
	bh=6KGthV4tzaFDj3AdVqt3lZ1JPdgm3iYGLTVOdGvXUYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qtrc9H1okaLzbmE+Rjqt7C4BwGX3P+5Ap7QSNqcPCpTVO3cGrwapLhVDlA+sySqSe
	 lifzYGJ1SCGvJvnVRr24cd8sMoVShLXfXILXyxgkiqyd690AnE7kyeTC3Wjz31FOfX
	 BkrvjYcGJfwl+Idhtf6RkSU5ahN1LBVIYdZXeUjW7L27pgV7mpbAQ71XgEvoRM9BHa
	 8SJkdzueATLWi9GSZr4bjH7ZhIQWikm1vFxMTVr+NvL6VXjFCeadzbJE6EnDq7azor
	 p6oM2bzkQL8h0NJVyHLdKcIhwzlAPbExatE7LnHk6LIRhGdu2KRqXdS11i+AXfkFX2
	 /ddNC85ZfVEMQ==
Date: Fri, 28 Feb 2025 14:17:30 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-kernel@vger.kernel.org,
	Jamie Iles <jamie@jamieiles.com>, linux-watchdog@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 06/15] dt-bindings: watchdog: Add rk3562 compatible
Message-ID: <174077384995.3598768.385877979363043345.robh@kernel.org>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
 <20250227111913.2344207-7-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227111913.2344207-7-kever.yang@rock-chips.com>


On Thu, 27 Feb 2025 19:19:04 +0800, Kever Yang wrote:
> Add rockchip,rk3562-wdt for rk3562.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
> 
> Changes in v3:
> - Collect reveiw tag
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


