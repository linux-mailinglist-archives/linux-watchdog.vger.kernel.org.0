Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F06838E7EC
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 May 2021 15:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbhEXNoe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 24 May 2021 09:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232953AbhEXNo3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 24 May 2021 09:44:29 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02506C061756;
        Mon, 24 May 2021 06:43:01 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id y76so17827362oia.6;
        Mon, 24 May 2021 06:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nF07paaoG3jGvPxI4nip343c9NWP2ELhNwJytuUtMbI=;
        b=pp8vSGVbBXgNqo9c8hQQENnz8utSW1ro/pYR1mn3XfB/1hrgyvqQ/JeEe8w71D7E3u
         laWYwAlw2G047diBzJhfMlCPkzi8XRpuHELXkwPNzBNxJuWZJFEROo968ZUSvZ0Gmiph
         GS+PNA4LzAS8L2EoEaG+m9ttB0txWtoyZQ8MeIPsXd8DsvKqeREcP6ctyrL2D74XNkxv
         TcKDB0Tp9D7wJzFBpPdl87Yg/f9rR/Ilw/rPKa4kaIXFc59jp7a1QJEJX3//GAMCTBQV
         fV8jvC3gX3hRHvugeHLbH+jGH4QeYQ+ufMhD06nleYu43oOJeDNA0Rvng5iW3L+t11fS
         q89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nF07paaoG3jGvPxI4nip343c9NWP2ELhNwJytuUtMbI=;
        b=nHpGM4utOQlDjdh0UmK4gc6iEydO9tYPZBoXQ5x3rOf6koHxdaRHWIWaF0kYkftsPz
         gc+sXruzzamCRqbWAIn4TQaQmHWZxMpjlCOzy6ofxPPZCNNDacBlbFevsAh8C5gzFNJO
         EecvK7yp+Ge50Zv/mBx29FKaX2lKGTznnZVHXXzaMNRLST0H+zvDuyh2ZBHyre/QI0no
         OmtyflwRFuBNF4UMfR9mq3b8VmEF2oZAP5OahH8N+/S6N/niIIS4Qvo9EpT5n5WBDszo
         1RIwjYCR5K2IJ15pDSGCV8qIsK1Kc0KSffKm8lfNjoTlmDVFdvTgyJhfYY3T0QB9QNDN
         emfQ==
X-Gm-Message-State: AOAM530WEu8bBYNyF0fOYxcAcRrI3JOfrCtNkbi0vPSPhzViKWQhkoYm
        gUM3a49lOBKyz3v5bRossSw=
X-Google-Smtp-Source: ABdhPJw1qWZNHAl/oNtYKGXvY5CoCsK4IKNju8UmdZeSMgRQERXGZ/cO8E7q+Uwak7Z2w4dtmnIDUw==
X-Received: by 2002:aca:bc8b:: with SMTP id m133mr10646488oif.10.1621863780404;
        Mon, 24 May 2021 06:43:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c18sm3111268otm.1.2021.05.24.06.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 06:42:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 0/9] Intel Keem Bay WDT bug fixes
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "Sanil, Shruthi" <shruthi.sanil@intel.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kris.pan@linux.intel.com" <kris.pan@linux.intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Thokala, Srikanth" <srikanth.thokala@intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Sangannavar, Mallikarjunappa" 
        <mallikarjunappa.sangannavar@intel.com>
References: <20210517174953.19404-1-shruthi.sanil@intel.com>
 <BYAPR11MB312848D2D369C78BD2E969F0F1269@BYAPR11MB3128.namprd11.prod.outlook.com>
 <YKuBppIuUHqkiMg4@smile.fi.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <88c07283-981c-b998-59a1-315f94f10f3e@roeck-us.net>
Date:   Mon, 24 May 2021 06:42:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKuBppIuUHqkiMg4@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/24/21 3:36 AM, andriy.shevchenko@linux.intel.com wrote:
> On Mon, May 24, 2021 at 06:06:35AM +0000, Sanil, Shruthi wrote:
>> Hi Roeck,
>>
>> I have addressed your review comments in the v2 version of this patch series.
>> Could you please review?
>>
>> If no comments, can I get an Acked-by tag?
>> Thanks!
> 
> First of all, do not top post!
> 
>>> From: Sanil, Shruthi <shruthi.sanil@intel.com>
>>> Sent: Monday, May 17, 2021 11:20 PM
> 
> AFAICS Guenter had reviewed (as you put his tags into commits). It means that
> maintainer will pickup patches when they feel it's a good time.
> 

Yes, and the patches are queued in my own watchdog-next branch.
At this point we'll have to wait for the Wim to pick up the series.

Guenter
