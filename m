Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C18C31237A
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 May 2019 22:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbfEBUhs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 May 2019 16:37:48 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:32910 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfEBUhs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 May 2019 16:37:48 -0400
Received: by mail-pg1-f193.google.com with SMTP id k19so1597177pgh.0;
        Thu, 02 May 2019 13:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lB3153gephrYxcmT3quKYHaWZwBf38K9on4i1nocN3I=;
        b=P/oDQ3iEA/WOc26RXS4X8SvBiZHJkrh3wOZtPeSx9JOaFTbHSzlx3Q4fA3Aqty4B+Z
         o8Nq5Ek5szN47A/z8rMtj8W2YG/qZ/TTNaDDgH8PNsNz8BvBnOl38+COU0QNhG1xipdK
         A1ryhanmxQqYgYhvezsfFmV8egmqmA2MVeMs/u/FNHgk3tze5GxfB1LXbd8mghd1DJnR
         hR/WTm2WxlhZ8Xo4wu/VLgJqYK/CSzomKQEq6FTVxoHJqDAINH5e8WpmpN9ZyE9LUaiy
         WsGV1DpnNlMrb+IpCsdtj3IsYIMYLIdlmWAQEi5ZwE5Y43w9dZzfWzl4rZ3X8IwyUQl8
         DpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=lB3153gephrYxcmT3quKYHaWZwBf38K9on4i1nocN3I=;
        b=ShYLa1efXNGv2oGbVeCLk7VTvsKfEKoal421Zpx1BH9oMGc2eN0omHZzHfqekYpRVs
         GaPzGe+YeCQ9jmaaz7zbZMXny5T34DCL1m86Gyx9xgkzISmfSldkZivYLzYGq14tXREy
         zkIlJFoUiemXxzT4mFQkUVAi2L9wLBg+e4NCpmhseVc9Emikj5K5hCFdc1OfQ2SbFDUH
         uDIVbeailHeN/ApIc2bnKnS9amBlT5lXAJlgC6XS+mm/hnD2x1NqQBfqE6qBKcARQOmr
         w8lEI3no3mtWZExBE/iOy05NykC3khbE+x8lhcobmvIMLutJTWOPfA8wmp6Xf/1vCz9j
         lGhQ==
X-Gm-Message-State: APjAAAXqjw0+mzZAMFylxTmJ9Soyx0yCYxA/zxKN8oXQC1qBjAKOqfX8
        I1Cbvh+zaeKyp0vp5LxgLC8=
X-Google-Smtp-Source: APXvYqyilhmEsuIDyLQfBiy9K3iHNs3WdUCcQSY2UIJxnpVVDV+IilDatLb+uAr77L+IHncIvscboA==
X-Received: by 2002:a63:1d09:: with SMTP id d9mr6061374pgd.289.1556829468009;
        Thu, 02 May 2019 13:37:48 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e23sm31531pfi.159.2019.05.02.13.37.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 13:37:47 -0700 (PDT)
Date:   Thu, 2 May 2019 13:37:46 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ludovic Barre <ludovic.Barre@st.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH V2 0/3] watchdog: stm32: add dynamic prescaler support
Message-ID: <20190502203746.GB29063@roeck-us.net>
References: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, May 02, 2019 at 04:08:43PM +0200, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch series updates stm32 watchdog driver on:
> -use devm_watchdog_register_device
> -Guenter's recommendation about return value:
> set_timeout return 0 on succes, -EINVAL for "parameter out of range"
> and -EIO for "could not write value to the watchdog".

No, sorry, that is not what I meant.

set_timeout() should set ->timeout either to the requested value
if equal to or larger than the maximum timeout supported by the
hardware, and to the actually selected timeout otherwise.

Guenter

> Set of reload and prescaler registers are stay in start function,
> because the stm32 watchdog must be enabled to write these registers.
> -adds dynamic prescaler support
> 
> Ludovic Barre (3):
>   watchdog: stm32: update to devm_watchdog_register_device
>   watchdog: stm32: update return values recommended by watchdog kernel
>     api
>   watchdog: stm32: add dynamic prescaler support
> 
>  drivers/watchdog/stm32_iwdg.c | 96 ++++++++++++++++++++++++-------------------
>  1 file changed, 54 insertions(+), 42 deletions(-)
> 
> -- 
> 2.7.4
> 
