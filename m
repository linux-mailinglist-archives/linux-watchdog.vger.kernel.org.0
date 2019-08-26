Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01E619CEEC
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Aug 2019 14:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbfHZMFQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Aug 2019 08:05:16 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42934 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbfHZMFQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Aug 2019 08:05:16 -0400
Received: by mail-lj1-f194.google.com with SMTP id l14so14804150ljj.9
        for <linux-watchdog@vger.kernel.org>; Mon, 26 Aug 2019 05:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=674zUEpW1qMBR3Wi1BQtNz764/jC32fVo4Wnlz37HVc=;
        b=Lf7HVzPz79lDRnTThZqVbYKB0aAd2zA1zy/h7fW06v68QWEw1WNy5mQZbXpt842yYq
         qxTTWJJRBCD2WDttnzkUs5l5niy76+oPT4xj67RbO7fqvEDVN+M2nq24zp3fBjfuRj75
         EyO5njAJHM6F6xW/gCMI2K0/cA9l5x8hvy6xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=674zUEpW1qMBR3Wi1BQtNz764/jC32fVo4Wnlz37HVc=;
        b=YoSRkl+DhChTHZSWRFZrznihrNLr+6l39eT/DO0Nb3kL7h9FtNnqYw617y9dnLJDow
         tI0x03uqf/1Q3O3PsS/z+4xNouQ+PobbGQDlo1Pg9FbjH3H0KFTXReK89igeMy0F3J/n
         GrYVcxf5D4ED3b2CGnOS2j0YSqKZffE0ZGb/JAq1phG+1hOHSvRNjJrwVot8cEs9Qlkb
         eTKRII5+40H/I5lI1TjvJJiGXa1fp8jlDQNw27tJr+8ywjFFpKAPwhN+fXVJDWoD0+mx
         tz5ygkzuND5wYrFGm1V7CBxKfT7/CQDPY8chk4WLGLMZQl5jIkdxcfB5WFwVj2xSX7wx
         eg7Q==
X-Gm-Message-State: APjAAAVJ2khpnce3ZQZhlkI5nlaZ6XBXKw5B6QtSn5aGzdz1Xj898+Hd
        XKlTs/h+MVDDZS1JWD1ayof5mQ==
X-Google-Smtp-Source: APXvYqx634hTfDpHZkU+yXAO9eBjOGIvulK43Z3s5tUBVD+a3YmY69JSLgMzlfPXQ8Gyo7lOpk7wyw==
X-Received: by 2002:a05:651c:1111:: with SMTP id d17mr10009917ljo.87.1566821114243;
        Mon, 26 Aug 2019 05:05:14 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id h16sm1969294ljj.73.2019.08.26.05.05.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 05:05:13 -0700 (PDT)
Subject: Re: [PATCH] watchdog: imx2_wdt: fix min() calculation in
 imx2_wdt_set_timeout
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Georg Hofmann <georg@hofmannsweb.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20190812131356.23039-1-linux@rasmusvillemoes.dk>
 <77faf1bd-14cc-831f-e65e-4f2aa74e1843@roeck-us.net>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <8a7a29d4-92ed-1256-6c91-c2e528e58e3b@rasmusvillemoes.dk>
Date:   Mon, 26 Aug 2019 14:05:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <77faf1bd-14cc-831f-e65e-4f2aa74e1843@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/08/2019 15.28, Guenter Roeck wrote:
> On 8/12/19 6:13 AM, Rasmus Villemoes wrote:
>> Converting from ms to s requires dividing by 1000, not multiplying. So
>> this is currently taking the smaller of new_timeout and 1.28e8,
>> i.e. effectively new_timeout.
>>
>> The driver knows what it set max_hw_heartbeat_ms to, so use that
>> value instead of doing a division at run-time.
>>
>> FWIW, this can easily be tested by booting into a busybox shell and
>> doing "watchdog -t 5 -T 130 /dev/watchdog" - without this patch, the
>> watchdog fires after 130&127 == 2 seconds.
>>
>> Fixes: b07e228eee69 "watchdog: imx2_wdt: Fix set_timeout for big
>> timeout values"
>> Cc: stable@vger.kernel.org # 5.2 plus anything the above got
>> backported to
>> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

I'm not seeing this in v5.3-rc6, did it get picked up?

Rasmus
