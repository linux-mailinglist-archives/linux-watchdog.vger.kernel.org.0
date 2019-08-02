Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36E077EBCA
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Aug 2019 07:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732007AbfHBFDp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 2 Aug 2019 01:03:45 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46233 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfHBFDp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 2 Aug 2019 01:03:45 -0400
Received: by mail-pg1-f195.google.com with SMTP id k189so16388635pgk.13;
        Thu, 01 Aug 2019 22:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=PLsx/4tn1KtP1jYMaN33B6Oq9wyWpKhmw6fy97XSp7Q=;
        b=TkuE3yuzGt58MAj2g0b9+TEZYDKQ5B0CtD4Z/w+cOGpWu3CxLZT7bAijxRoRH55NqA
         ZACsCOjyEyHorztntjV/PF9wpawc5ofE67ZFDXSbQT4N8W4S01I7kZ9wogzMlSN0ZZXk
         ZgrvWXMtzBUzGnDsaWsHNXDNgmYVLI1NQSg0czgPrBzokvm7WBwo7mSpKnYCeSB2XO4z
         n8fc8V5s7UpXNJ4dq5a71JHBBAeQ1sYBuZfOedKauU398Biwl8ya0Mlyg25bT+QiJPEP
         Bw1gm6NMpjSt9CfleE5g63njrFVHcC9nYm2M4ZhhUNkH6aLdibamnLc1vhcWa+u8cOkr
         XYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=PLsx/4tn1KtP1jYMaN33B6Oq9wyWpKhmw6fy97XSp7Q=;
        b=FvNmexNdbQzpsuYVFy5JmeHPigQTT2QcfhFFT2z/eN+6x6jld+nA8+uYzH7mEKUSN9
         a+lOh6Nvn47RmGFOC/1LEHAKrGNOuTp9q//XN08naM4GaQf4DawwE0bg6WUHWCnE/xGE
         NIWgDu8LjgFzt0982j/+lGRGKHXjD210Lj6+QOcAnifGk55vYKt7N/Pb/ZVxae788ILD
         yRqNIw1+nz3lfUSAaiWX0vZ6pTXYns5xcWF+b+ZEqqUTwbSu2rgu4vSiiZ6g4btSTrGR
         WwMRZaaVRJbiBA4kY1PBukDvuPMzDbpf/Jt9cM4+NsFY9W/4Dp+QxeU4EYWaSXGVluRP
         GZOw==
X-Gm-Message-State: APjAAAUj1YrpC8lrs5n9nBUTrXXuqChXWbpDuHI1JqPSQQsmfiPFQTNt
        S4pFwlX28w7nkMJXjvSK17g=
X-Google-Smtp-Source: APXvYqxvaxTQu4MapFsaY7OEEournyukc7qIz8j4d9yHlwAR6d+6iOboTRELkhHyATur6jTL/w0QVw==
X-Received: by 2002:a17:90a:30e4:: with SMTP id h91mr2364646pjb.37.1564722224831;
        Thu, 01 Aug 2019 22:03:44 -0700 (PDT)
Received: from [192.168.1.4] (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id s66sm77417263pfs.8.2019.08.01.22.03.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 22:03:44 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
X-Google-Original-From: Mark Balantzyan <mbalantz@exun.local>
Date:   Thu, 1 Aug 2019 22:03:39 -0700 (PDT)
To:     Guenter Roeck <linux@roeck-us.net>
cc:     Mark Balantzyan <mbalant3@gmail.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] watchdog: alim1535: Rewriting of alim1535 to use
 watchdog subsystem
In-Reply-To: <7e17ddd7-e304-67f0-836c-8ba71c5a6778@roeck-us.net>
Message-ID: <alpine.OSX.2.21.1908012203130.6581@exun.local>
References: <20190802032655.54758-1-mbalant3@gmail.com> <7e17ddd7-e304-67f0-836c-8ba71c5a6778@roeck-us.net>
User-Agent: Alpine 2.21 (OSX 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Please see: https://lkml.org/lkml/2019/8/2/6

Thank you.

