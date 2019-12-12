Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28E9011C255
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2019 02:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfLLBjn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Dec 2019 20:39:43 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41425 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727297AbfLLBjn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Dec 2019 20:39:43 -0500
Received: by mail-pg1-f194.google.com with SMTP id x8so266524pgk.8;
        Wed, 11 Dec 2019 17:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jcEFefOBgkTbuCgx02nnmSywE4fFjL33e6Qr6u/eGyo=;
        b=UHgVF9wKnMAzPdq+8k5+tMF0N9py4cpouWLLfgPZWIqY2oeBxzLoez07bzCF5YV8Oo
         ted5AFT/usdkmhZQTmxbVaTUlLuX+VA/uHgSLLdkMEBOEv0jdhl9TjCUDHI5SsJT0cDA
         JPQoU1Ou+TtyhjbkobibT8kwd84QdOklMkZUuFimMz0eHfDPZH5IsHL4lHZgpGZ1ZrgJ
         9+ac6z/XFdw1ktqyYe7t8xTeSrd6H115SaM4Yn56A3lb85Nx0RtdFuJFdRKDgIqkEg48
         h5SuwWNWn0A688v+NbjMSHoQgbnDeXf0/uIERUY9plp4jQ+tuZmLhVgAL7VqBfhK2qGH
         mbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jcEFefOBgkTbuCgx02nnmSywE4fFjL33e6Qr6u/eGyo=;
        b=rGvzr1ODU9TklJ+t494LD16ohAcpd7VjX2Q6hz8aBlhZKt/M/wQpmcT7/2whRAa4a3
         xebZKWWXAR4IE/PKx6KpJftJez4Cqq9XYs1P7TDNF+5Y6fStTP1GLC8e+uE+ZackdmWh
         6ABC1jEnaQ0oruszpZcpTUM78DuGIXD3Tio5apaGowzVBMu42I47p2MmKpWY0W6uTgIh
         yMR6g6cRQbhYU4pEcB7UdDOyS0xxxmu+BMLuxIiMkvZHi9LzRxjovXoBRPuqed8oDA8B
         8zf2cyn6pCWAbukMe5N0Xj7bEbdAtO7N19DkZ6s7F14do0cofdtwh8/DQ3R7X3O+d7YF
         SCeQ==
X-Gm-Message-State: APjAAAWwglJvsV4j1vkKRdDMJdDmbIFy7HSqzUMWtCMqTRBuFCE4JWQm
        FBIV5OBzR2j2CqSxJx9r2ZU=
X-Google-Smtp-Source: APXvYqyttOxmSzS2h7erROIt6mz49uxLvt//PkJptC/TdhyxqocBs//U9yo7tar5mVXbrXrZE6ardA==
X-Received: by 2002:a63:6704:: with SMTP id b4mr7845796pgc.424.1576114783067;
        Wed, 11 Dec 2019 17:39:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g8sm4424271pfh.43.2019.12.11.17.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 17:39:42 -0800 (PST)
Subject: Re: [PATCH 0/2] watchdog: mtx-1: Relax build dependencies
To:     Denis Efremov <efremov@linux.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mips@linux-mips.org, Paul Burton <paulburton@kernel.org>
References: <20191211210204.31579-1-f.fainelli@gmail.com>
 <1a3eb533-b273-f903-ccaf-fdeaea9da51a@linux.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <87f90857-633f-2437-4a26-a3b3dd7ea7c7@roeck-us.net>
Date:   Wed, 11 Dec 2019 17:39:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1a3eb533-b273-f903-ccaf-fdeaea9da51a@linux.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/11/19 3:46 PM, Denis Efremov wrote:
> Hi,
> 
> Thanks for the fix.
> I tested the compilation with these patches.
> You can add my:
> Tested-by: Denis Efremov <efremov@linux.com>
> 
> Look like this error could be fixed the same way:
> In file included from drivers/watchdog/ar7_wdt.c:29:
> ./arch/mips/include/asm/mach-ar7/ar7.h: In function ‘ar7_is_titan’:
> ./arch/mips/include/asm/mach-ar7/ar7.h:111:24: error: implicit declaration of function ‘KSEG1ADDR’; did you mean ‘CKSEG1ADDR’? [-Werror=implicit-function-declaration]
> 

This is yet another old-style watchdog driver which should be left alone
unless it has a bug that needs to be fixed. Really, if anyone out there
is still using this driver, converting it to use the watchdog core
would make much more sense.

Guenter


