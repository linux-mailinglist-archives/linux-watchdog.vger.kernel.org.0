Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5F415CC50
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Feb 2020 21:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgBMUX5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 Feb 2020 15:23:57 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50334 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728260AbgBMUX5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 13 Feb 2020 15:23:57 -0500
Received: by mail-wm1-f68.google.com with SMTP id a5so7675859wmb.0
        for <linux-watchdog@vger.kernel.org>; Thu, 13 Feb 2020 12:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z0gjJEmRAwNymPwA00fmzFhjNC7Qe4kL5vReX8cevnI=;
        b=Hz/xL3g4x51bG7UTsON1g0txoL+UQIUGlDIxuBxUvr2H3k12pXc/T/otefb4iCRVft
         4ov86aKFTIW1nMR+qgtLawZAt6+nyiYLHH4OCVRSmd1Fh3PaOR9aMQ/e5M/sPXu7owO4
         jOS7Po0sT9ic7cUHflzW8HE8OycaB9fYChOyRnCocqK6mu1rT/gnzpro/8OZSG+Ay0kk
         C+ANlMSCQ/oPcITNh6DtEDm5Mr/DpbgwrsDe8A3Vo0JQot/cuxDnVwJ6MIYADFOig9Aq
         xt6hnnucC1kJVZpl7n7GqLBnFfhymOeWIUp+ApzWYNs0sqVarGSIZ/fw/Nb3LhVBOYeF
         y/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z0gjJEmRAwNymPwA00fmzFhjNC7Qe4kL5vReX8cevnI=;
        b=OCzjDebLLxJ9pkcP0R0JA4spn4rxFOJFJarWfEIuklSb/mBVgF+vjqNJCrxXQF1E/V
         wckgtXM1F1Vw2FzI9agC0cTjgKRxTkEmqLHtUhwFxuj7hts0LB97yuSrgOvBcRwaM3Xt
         l/7ssoAOmVQzl8eH4IimUvVL7TrvOI6albGjNBraTGXTXCO0JbNuSSkj6XTKeKsBMpiK
         /RhcgjBTrZe6/WUbJFoniALC49JhlzL1tTHt6dWMgcp002tuz4RyOk1Qo0dmIEM1AdKT
         fpX56BwNjZvnzWl7VRAQweih1HlKR2tI+L8yrO/aaf3wHqm3vWCNFWo1UCqYfMZ9tz8p
         83CA==
X-Gm-Message-State: APjAAAV1qtKY/YuoemWpdf9Y4DoH1p4l1i9wEOeWV/h99VGljFEq2S+J
        QCDGfA8HOT8fOm18lMq1PmszwWYnlus=
X-Google-Smtp-Source: APXvYqzqyPeBFBhVewwKaBK9XjxIwvnsPNpsAByNUUEuukhTDypWS6UDuisfdJZDF6q4I4Mj1hC2NA==
X-Received: by 2002:a1c:a5c7:: with SMTP id o190mr7779715wme.183.1581625434916;
        Thu, 13 Feb 2020 12:23:54 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id o15sm4276160wra.83.2020.02.13.12.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2020 12:23:54 -0800 (PST)
Subject: Re: [PATCH 1/2] watchdog: Check WDOG_STOP_ON_REBOOT in reboot
 notifier
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
References: <20200213175958.105914-1-dima@arista.com>
 <20200213175958.105914-2-dima@arista.com>
 <20200213191230.GA17448@roeck-us.net>
From:   Dmitry Safonov <dima@arista.com>
Message-ID: <3de88f30-e601-77b3-d477-ca9ce461c920@arista.com>
Date:   Thu, 13 Feb 2020 20:23:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200213191230.GA17448@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

On 2/13/20 7:12 PM, Guenter Roeck wrote:
> Does that really have to be decided at runtime, by the user ?
> How about doing it with a module parameter ?
> 
> Also, I am not sure if an ioctl is the best means to do this, if it indeed
> makes sense to decide it at runtime. ioctl implies an open watchdog device,
> which interferes with the watchdog daemon. This means that the watchdog
> daemon would have to be modified to support this, making this a quite expensive
> change. It also implies that the action would have to be known when the
> watchdog daemon is started, suggesting that a module parameter should be
> sufficient.

Yes, fair points. I went with ioctl() because the timeout can be changed
in runtime. But you're right, I'll look into making it a module
parameter instead.

Thanks for the review and time,
          Dmitry
