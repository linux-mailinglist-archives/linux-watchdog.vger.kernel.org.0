Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9907B9501F
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 23:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbfHSVt4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 17:49:56 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35620 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728136AbfHSVt4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 17:49:56 -0400
Received: by mail-pf1-f193.google.com with SMTP id d85so1974938pfd.2
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 14:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VceAuc+FpciG9eTR7FYV47JhtJXMb0opEOEHVL4MdFE=;
        b=a3IAarVZt4x6Dd/+bGCEmED0WR4bKDm7nvtZwF44KHsnbYliOZ4xn8p+6reM9P8+Qz
         eWfKx66vqkY1erqo45VDLCvKRewjJCwx8d9XSGGainKOuA0mdPaxSKJIzGsOUGPU9Bg+
         7VscJYo1AaEnJUyNbMIDQvkJ+67fUH2I1anTtAlfoM0y7jc3Tpzxg0+/4Uevjmk9CRlQ
         OeWmoKpbyVtrSDwK6LFLFEHpb/hjqqRx5Hbht9Oc4O87JMiP7PuiMMxYZsHVDB1ZKKCZ
         WwFgDOlwqPtHPFbgkudpYIVGu3vo0v2kg9v2wPX0k17H29M3PfpL9Zp9pciWNng7V2jp
         CFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=VceAuc+FpciG9eTR7FYV47JhtJXMb0opEOEHVL4MdFE=;
        b=NU7YacwFmYGsi4owCcZONRlmbuhStGZ9ZQVWgVPnA+S2s1oDEnHCk0gkhx2Q9gh2N6
         W1ehHYIKo/Z5cW1tebAZPTV8QokubJaF1bIM7vi5464jXJn+tNxgbCAWZvt/jS2S6X07
         ADoVBxzibKCc9si4acom2FL3CUWsMdWUfgCCGQTFJGKE/OnvgI6FYtzA6MkGnnJ8Emo5
         /41D/BTw6Cm1tv8nJEGYCmTp2T54b3xPlw3/PqeiXDQiS8PDl8uJe1InssC/YHmBcLJ7
         EjuKvj7EwqbAe5bs6UT2t3XPlL5lw5Z506c2e1rB3WlgeRyAvRJq7tLmUmJG8eu//OZ+
         YgNw==
X-Gm-Message-State: APjAAAUe5VuJ5HAifxzC1ImmteJx6giotBNLsMKHH3jMKKDj8ya7+Mij
        QQuINiA/JHSXzEnUb8wAq7sanbcO
X-Google-Smtp-Source: APXvYqxlWyshnNWX+PvRQE0VK/jlmqtJ4sLNWL659loewwye2o9FQ/u/sXFNnyjSixegn50HdYgxnw==
X-Received: by 2002:a17:90a:21eb:: with SMTP id q98mr22383146pjc.23.1566251396097;
        Mon, 19 Aug 2019 14:49:56 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id h197sm18510794pfe.67.2019.08.19.14.49.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 14:49:55 -0700 (PDT)
Date:   Mon, 19 Aug 2019 14:49:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Convert@minyard.net, the@minyard.net, IPMI@minyard.net,
        watchdog@minyard.net, to@minyard.net, standard@minyard.net,
        interface@minyard.net
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 04/12] watchdog: Allow pretimeout governor setting to be
 accessed from modules
Message-ID: <20190819214953.GA7517@roeck-us.net>
References: <20190819203711.32599-1-minyard@acm.org>
 <20190819203711.32599-5-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819203711.32599-5-minyard@acm.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 19, 2019 at 03:37:03PM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> This is so watchdog driver (like IPMI) can set it.
> 
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  drivers/watchdog/watchdog_pretimeout.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
> index b45041b0ef39..270baf7b3fa0 100644
> --- a/drivers/watchdog/watchdog_pretimeout.c
> +++ b/drivers/watchdog/watchdog_pretimeout.c
> @@ -95,6 +95,7 @@ int watchdog_pretimeout_governor_set(struct watchdog_device *wdd,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(watchdog_pretimeout_governor_set);
>  

I don't think that is a good idea. The whole point of pretimeout governor
selection was to be able to configure it from userspace.

>  void watchdog_notify_pretimeout(struct watchdog_device *wdd)
>  {
> -- 
> 2.17.1
> 
