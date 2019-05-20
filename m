Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9272B22999
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2019 02:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfETAxq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 19 May 2019 20:53:46 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56743 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726741AbfETAxq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 19 May 2019 20:53:46 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 2D6D021B62;
        Sun, 19 May 2019 20:53:45 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Sun, 19 May 2019 20:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=IKQ/37nMD5A+Hd+4pWByr+SK2ki+Us4
        m55lw4WtdEyw=; b=GzOBLbJIVtZp6r8QM7+uaRLVJDzXoW8KRolE7vQZN1DrnLu
        pBvLeTSgJkF2G2yzhSskCFemY6iQig+YHsMJeZTbDQT1dvN5pHeVjfMQU+lNFkxW
        4BhJgb875DGzinEwd2HWPCSK3LcX6S9jb0z5imDRsalXcSrZiw75/QTMJZuEmtr5
        Muk/0YMrlqsLFFER8Rz9qMgNQho/+1p/sUh22U5fEPKERy1n1Qem6q8DtP6keIRQ
        j+sCxkpZwrlVvEV+RSJX9R9bdYgPcpjOopuT3EvIVz5s4T1d+K18XPF2Pe+5rstC
        9ny5WazLHAWml7mWGBR+4AlD/4ymUrjojg/YeWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=IKQ/37
        nMD5A+Hd+4pWByr+SK2ki+Us4m55lw4WtdEyw=; b=vVf+4ggOnSk7b/kG0B+oht
        u7z9y/e6dyAoJTtLV49yBQjFdR+40q3PAHj/uBO7cCeTr297HoEwoYjzk6WdJX1E
        Vu1w/2QwHG4bmRozBgqzRbRHK7y4Yrv60PlTA+lFriIQcDfFQHIV3TwlvZzWgbc3
        zz+FGT4hwd4Xj6ko97wiOABoVFOodfkJE/81IArywtTj1nlCNIm9QgigdPyVGOfU
        Q6ZBD7o2bWWrpFMdycAVALGwQbHKaz3mKIp58uNwx9dHajp3N+JpQbua5nx6NEHn
        Y8KyWzbUM84zopVdVSyYvLSZO5t/YTQ6gWSQcolZfmYEsQCTtrIEphSsBaOu5B6Q
        ==
X-ME-Sender: <xms:l_rhXKebJXC20318JFacfWn-xJ5Kxx25KapUGK8-yYbRljv_-VmEVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddtjedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
    rhfuihiivgeptd
X-ME-Proxy: <xmx:l_rhXFdlcfVC2R4gvRRLcWlk6EAvQd1alOaCfmHth1q7koPcn4EeRg>
    <xmx:l_rhXKNRbN5PzvGaLd5Ru55FE2MBc1aGsUpQCXc7SoP9LvqYA2k94g>
    <xmx:l_rhXKBVHpPwUorFqQvwgrEUADQZGuX9nicQvBpOL0uyBXmu5Cp5CQ>
    <xmx:mfrhXFN8FLaiDRsGCJxocRH2z7n2s993B6ha0cC0rlgntpTrfUbJLg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 507E47C3E9; Sun, 19 May 2019 20:53:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-549-ge400f56-fmstable-20190516v3
Mime-Version: 1.0
Message-Id: <d767a4f0-5965-4578-9d15-9c7f3dafa35b@www.fastmail.com>
In-Reply-To: <20190518212801.31010-4-wsa+renesas@sang-engineering.com>
References: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
 <20190518212801.31010-4-wsa+renesas@sang-engineering.com>
Date:   Mon, 20 May 2019 10:23:42 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
        linux-watchdog@vger.kernel.org
Cc:     "Wim Van Sebroeck" <wim@linux-watchdog.org>,
        "Guenter Roeck" <linux@roeck-us.net>,
        "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_03/46]_watchdog:_aspeed=5Fwdt:_drop_warning_after_r?=
 =?UTF-8?Q?egistering_device?=
Content-Type: text/plain
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On Sun, 19 May 2019, at 06:58, Wolfram Sang wrote:
> The core will print out details now.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/watchdog/aspeed_wdt.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 34117745c65f..3ad2558a6de0 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -313,13 +313,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY)
>  		wdt->wdd.bootstatus = WDIOF_CARDRESET;
>  
> -	ret = devm_watchdog_register_device(dev, &wdt->wdd);
> -	if (ret) {
> -		dev_err(dev, "failed to register\n");
> -		return ret;
> -	}
> -
> -	return 0;
> +	return devm_watchdog_register_device(dev, &wdt->wdd);
>  }
>  
>  static struct platform_driver aspeed_watchdog_driver = {
> -- 
> 2.19.1
> 
>
