Return-Path: <linux-watchdog+bounces-1878-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4619772AC
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Sep 2024 22:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 690A1281D38
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Sep 2024 20:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90F51BF80A;
	Thu, 12 Sep 2024 20:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DurCSC3g"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC85A5F;
	Thu, 12 Sep 2024 20:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726172624; cv=none; b=gEoTYjYnvf4PL6z28DCfAGXmrMlkm3JFL+BFaKvX5CNcERwCxRgG2Y2GrKFuRecISlCm2JAiLZwSCjflCYsYcZsQzRE6p9iUDlTNDbQ6dwPRl5QkHG6jVEF1TMuK2Uno0gozEbx9ULD8lnv+xiw33xvWV3Ha/y0Y9j9J7D5utmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726172624; c=relaxed/simple;
	bh=QpmQl3wtvJU71f2obSC7dpuiYqwDCv+U4WLiEOinQ7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fch7nosqh0vE6XIQ/eLBbUquTBY7AwPc8GNiYY5ZzGJFVEO7V8xU5kMSd6iL2SiuhYKpfJ20uFPlaGzubC8OqauAIpN4IXZrgalPgAzRYXEmKW+6FsaHAvvHAtTtUssaRbhdA+qmGKlrRZxAB/z2WJA4wrB2yznkvefhMW1LQ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DurCSC3g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19024C4CEC3;
	Thu, 12 Sep 2024 20:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726172624;
	bh=QpmQl3wtvJU71f2obSC7dpuiYqwDCv+U4WLiEOinQ7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DurCSC3gTkwi3e+6B9d/K9i44XrDOzF9luCIXnKUFJhOucWii2WJdCWlVgwEkZNFQ
	 TI7rTbzXp+2sdnuK8F1Xpf9yKH5/f2BS+291HF3qwJ/0w1NvC8HzNHQ3Ll6dt4jHuc
	 1yLkmSXJxlrAVsBl02VcSgnijQSdIYsbGyS0JFxP91J+94NEx0+O3Lh/4JH7ESvuBh
	 2iC/gz+SZ5tVW9/LeL9UkaWihzfP1BDz1LGIFdPL+BX6aSKUFAP4qcYH37MKOZwtXs
	 QR3TzWETgAIuZsG+NbVr/9yJGBc15jqZ2UuyK6+E+a8WWIK8Aw9LrZgB1FTMNljCuf
	 lcn/QiUaZIA1g==
Date: Thu, 12 Sep 2024 15:23:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: conor+dt@kernel.org, wim@linux-watchdog.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, linux@roeck-us.net,
	quic_psodagud@quicinc.com, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-watchdog@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH v4] dt-bindings: watchdog: qcom-wdt: document support on
 SA8255p
Message-ID: <172617261979.727443.12146960187268113082.robh@kernel.org>
References: <20240910165926.2408630-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910165926.2408630-1-quic_nkela@quicinc.com>


On Tue, 10 Sep 2024 09:59:26 -0700, Nikunj Kela wrote:
> Add a compatible for the SA8255p platform's KPSS watchdog.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
> 
> Changes in v4:
>         - Added Reviewed-by tag
> 
> Changes in v3:
>         - Removed the patch from original series[1]
> 
> Changes in v2:
>         - Added Reviewed-by tag
> 
> [1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


