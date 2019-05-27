Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 218812B89A
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 May 2019 17:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfE0PuV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 27 May 2019 11:50:21 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42266 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbfE0PuV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 27 May 2019 11:50:21 -0400
Received: by mail-pf1-f196.google.com with SMTP id r22so6905430pfh.9
        for <linux-watchdog@vger.kernel.org>; Mon, 27 May 2019 08:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rgf8Y0/4ovL+LmTYoDIlN/SrkZ/9Ngb8OQ9i5T0xaEI=;
        b=jfcMZ2ym2oZ2OgxjqWSxko8XNlCGNMZO8Apo7X3taCgpUT3UKen9BtBdgmUVOaWkNa
         xRy6TobWFhw7KjiNvDlSIAK+hkMImVrBfZNUGTp4bLQiCfzXp9SSuKefykn8cu9S/7hl
         mYKZAKAbnw0eoJmny7NCUCq35AD+ZnvOyZ6oR+fkqiPjJePcGnnmPXRCrFW3IgidUL46
         rHut+8whYtTaA3xJNjdzyF0VabKouxxi8dp2KW5qR8Jehw2qHN1QBi8BCX7dPUApdN8x
         ufymTWnSGFD+XQcNjphE/pYdy/g0v3pwVDfUZIu4e6Mc2QjtuO9FoxKAfloyQnZUgDiu
         5Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rgf8Y0/4ovL+LmTYoDIlN/SrkZ/9Ngb8OQ9i5T0xaEI=;
        b=n1bRVMRjqDi/yk+kv/xeXF5x7HJlTTdwS2iitjIpQ2MXQK//d8+6f5jUsXUD4OqNfz
         OI5PUfWI69lIk68vx2mXBnd0fyuVIXnnrBSjp9CxvHMZBXn03EerCqkFb+Ae0xxETjJC
         qcmDc+iRrStpfh8+DEZ60fvKhKoRt5iqbUvSwYmSZ3WEE191tdBPcmfIqToKQ5w3AlAz
         yi7cUhYex5jtWjyT7+8YmWCeskPyrC9c4GdKQiLtp/HD3eVTUo7r6uQIICy22pxi5fNo
         dg+Dj6IuieZ/LXb+j7K82Z3dS8yuG9MIpBx1clEFjc6EUX2KhYpqDzyHjpap+heAwACT
         TLdw==
X-Gm-Message-State: APjAAAVS/S17r49VXW1UkDCEw4IyYQOGXHPaWnOkK0lsHwzpsnSj6RMe
        Ae+ki7eLN3YxAXXBJoPvqoxUB/jl
X-Google-Smtp-Source: APXvYqzku+qiyN8Luj+eza1+l5CN/6y9B+EyN55H1oi9M9t7ZgheYp67KOe3AyGc3G3iC5BUW02Obg==
X-Received: by 2002:a63:5c5b:: with SMTP id n27mr128655239pgm.52.1558972220547;
        Mon, 27 May 2019 08:50:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 85sm12335393pfa.131.2019.05.27.08.50.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 08:50:19 -0700 (PDT)
Subject: Re: [PATCH 11/46] watchdog: digicolor_wdt: drop warning after
 registering device
To:     Wolfram Sang <wsa@the-dreams.de>, Baruch Siach <baruch@tkos.co.il>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
 <20190518212801.31010-12-wsa+renesas@sang-engineering.com>
 <87y3332dku.fsf@tarshish> <20190519083201.GA1003@kunai>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <cbf8e182-c949-ba76-1919-c767f0cfa4f6@roeck-us.net>
Date:   Mon, 27 May 2019 08:50:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190519083201.GA1003@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/19/19 1:32 AM, Wolfram Sang wrote:
> 
>> Do you consider that not important/likely enough to be worth an error
>> message in the driver?
> 
> This can be discussed as a second step IMO.
> 
> I was looking at adding more error strings to the core but then wondered
> if we really need error messages for e.g. IDA failures. And if so,
> shouldn't those be in the IDA core. Do all IDA users want that?
> 
> (Sidenote: to the best of my knowledge, if memory allocation fails, it
> will WARN you, so no need to print something in the driver.)
> 

Correct. This is why it is discouraged to display an error message for
memory allocation failures (though some maintainers want it anyway,
but not me).

Guenter

> So, I took a step back and saw that watchdog drivers mostly print
> "registration failed", not more. Some printed the error code.
> 
> This series simplifies the current behaviour. It does not extend it. We
> can do that on top of it.
> 
> Thanks for the comment!
> 
