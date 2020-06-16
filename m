Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8478E1FBC11
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Jun 2020 18:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgFPQrm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 16 Jun 2020 12:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729051AbgFPQrl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 16 Jun 2020 12:47:41 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC7BC061573
        for <linux-watchdog@vger.kernel.org>; Tue, 16 Jun 2020 09:47:41 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d66so9776176pfd.6
        for <linux-watchdog@vger.kernel.org>; Tue, 16 Jun 2020 09:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MUr89EUbKoAuXWw9KQa93Cb226w8HZKUOmILusqBAcM=;
        b=fIMSmN/jiSqlqQOkLENVWDRzuKEVTkfHMeAjoaGTvJbkSenAM1hFQVDarWEphkZXW1
         nO6qXs3rGvX4Ffs0sOpWbyE5KWhOXzTNoNaQx/MMebKKlCf+ry8lAzA2qyDgIIcumPxD
         uDKhxI1Tfh2B97bZT4ioT5ZkUZGe+F4TE+/SMHSyifQ70ZB6Xt/uSuxGH82MDpMioWDY
         mYxHGvGWE7o9hciVpQxVHzpkhnAV28qvYdJ4HlnjfijsWaPU2KF7uhj5CoPk2ACUPLC8
         DEePjii0SWqnccat8l9mz+nd9rUuVVfyvvzStH/WqGSpCDxnPC3nnTSB/UZv4JRE5kYG
         OFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MUr89EUbKoAuXWw9KQa93Cb226w8HZKUOmILusqBAcM=;
        b=Bq25fviEUhrkUfvSm5cNhYIiYTitF7iS55oT3mF9A2X1KUKKTMQmkKDzyi4sgt+7/w
         cY+dPGDuAcTBzAV0ikPFfdF8PH5Co4zNAYZEeSaDpfk/4qvVej42YlcKT31axz1Tr8Sk
         wOWAi94N/hkpnoDd0/L8R4LpjM0Xu4NmVRniTaPX6/hFPEhJzRjaOOzoUGD8g8y/oR6l
         88uFtnPh9FqdJWh7EGVoU7uuJoLy6DMlPOkJBK2mACohWIMz/lsogWkj9w2ImW+rWJED
         KtxVDwPnOm2ELqvu9OYaPVZyBwCQ746RS7WV04OWyqTnB6Pksyox30pbliDFfF04WzwY
         d+gw==
X-Gm-Message-State: AOAM533Kw1/8+LNv6BwlQjFK8Cc0F1bLgnDI2N0UmbW+/iP3dThuA6gv
        98I609YjAsRdxQ0MLRyttPdkjgPf
X-Google-Smtp-Source: ABdhPJw7HeYDWiIDY+BDNBpfYTB7cBh6jbSulX18eBPxztY6DOmhFG3EzdS6ZerBLwLEbYs830wbhg==
X-Received: by 2002:a63:f711:: with SMTP id x17mr2812662pgh.79.1592326060892;
        Tue, 16 Jun 2020 09:47:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s11sm17059834pfh.204.2020.06.16.09.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 09:47:39 -0700 (PDT)
Subject: Re: Millisecond level watchdog interface
To:     minyard@acm.org, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Gabriele Paoloni <gabriele.paoloni@intel.com>
References: <20200616163740.GF3090@minyard.net>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <356111a5-de48-c14b-88c6-6d1accce0f92@roeck-us.net>
Date:   Tue, 16 Jun 2020 09:47:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200616163740.GF3090@minyard.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/16/20 9:37 AM, Corey Minyard wrote:
> Hi,
> 
> I'm representing the Elisa group, an organization working on making it
> easier to use Linux in safety critical applications.
> 
> As part of this, one thing we need is a watchdog that has a much finer
> granularity than one second.  In some applications, that is just too
> long.
> 
> Would the watchdog maintainers be ameniable to changes to the interface
> to support finer granularity?  Milliseconds should be fine, though higher
> resolution would be fine, too.
> 
> If so, there are a number of ways you can implement this.  You could
> make the interface modal, meaning that you "throw a switch" and the
> standard interfaces become millisecond-level.  Or you could create new

I would consider that a no-go. We have to be and remain backwards
compatible.

> ioctls with millisecond level granularity.  You would probably want some
> way to fetch the granularity of the timer, too.  Maybe there's another
> better way.
> 

We would have to add a new set of ioctls. Drivers could probably use the
existing API but indicate resolution in struct watchdog_info (something
like WDIOF_RESOLUTION_MS in watchdog_info.options, maybe). I am open
to suggestions.

Guenter
