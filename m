Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD46CE1DA
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Oct 2019 14:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727490AbfJGMgm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 7 Oct 2019 08:36:42 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40808 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfJGMgl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 7 Oct 2019 08:36:41 -0400
Received: by mail-pg1-f195.google.com with SMTP id d26so8135900pgl.7;
        Mon, 07 Oct 2019 05:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HqwQr0izSdX/SrDz5Xc8kECyxj0ZoycAuN4//WzOtYY=;
        b=ELijHLqwYVBcZ5a4pvTvoiOZnNdiS812VSeLgoKLexclFzzKWbdmD/sqXgJXE1fjgD
         jNTF2NHmVmZVy92KNpNVm+7QyNq5COD2fmfoJmVswy9YWgF3Hr339NWveBlovP+L29xw
         9tvp+7lFmllGAaI1D/5o1sRY0gl6+ySaUqgfqvE5EcDZwBtBHgxCpZrZ7c/y9V+QbvKH
         L7PIXI4qk+cgmMwKGIG9hJ9t+7qCG9ZJOjfdFkoefQi65vnJub5N2zxCfO6vSMUfZhof
         t6hD38lnd1ne6M4elbw2LdAkaXBGm588D8tsdVzjqYTJN26ZdMMtjJUTPupbM2P7LsO6
         Jdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HqwQr0izSdX/SrDz5Xc8kECyxj0ZoycAuN4//WzOtYY=;
        b=gNzuz4VAfRJW4bHgdZFVwHVH/ZM4aOsutAp3eF912x9r1ArL/MqPEy6edqYUEadBgu
         aiofB5spJzTRnIADX1g0C4AlMTOg/zj+lUFuhmgWI43gRE38hnRb7MXlSoHm02NDTMiZ
         PjE0fWd4CxNeekN1Z9jjXboGM27bCreSqreP0qGDojQ1uU1EngG50Az6T+/iMiYdh3Hz
         55z+SrtHzG5DPmLFn6smysv9l9W/9dEKTmyX7nY7IYpLpi+4WCePZ8eUm0Ucb7xOIJv7
         xzB700H0R4RWPhL5o55D3Kqfo6TVTzg+9MuTVf6kUwJQhB0CNTOuS3RTTjmVj0ESW//2
         K9OQ==
X-Gm-Message-State: APjAAAVhHJG5FtlbyhgpE3SDzVvk2h1yhSwoAsp9ezOkMRmjP8msjQEW
        85AVgtV9kBJ7XXjOjIixVVM=
X-Google-Smtp-Source: APXvYqzxDmr1SNxHY7hEO0gLriawaqCkKEHy1diUazv80cn7Rlpu7NS07uF3jOMW5Cvpe3h50gMNGA==
X-Received: by 2002:a17:90a:e28a:: with SMTP id d10mr33668362pjz.102.1570451800916;
        Mon, 07 Oct 2019 05:36:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 26sm14949155pjg.21.2019.10.07.05.36.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 05:36:40 -0700 (PDT)
Subject: Re: [PATCH 2/3] watchdog: sam9x60_wdt: introduce sam9x60 watchdog
 timer driver
To:     Eugen.Hristev@microchip.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.or
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com
References: <1570001371-8174-1-git-send-email-eugen.hristev@microchip.com>
 <1570001371-8174-2-git-send-email-eugen.hristev@microchip.com>
 <e58a3ab5-69bc-cad3-5faa-ed00ff7906c7@roeck-us.net>
 <ab7b6b45-5e6f-100d-51af-a82ac325d948@microchip.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a9adf20c-f730-a7e9-a826-59216c17f03d@roeck-us.net>
Date:   Mon, 7 Oct 2019 05:36:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ab7b6b45-5e6f-100d-51af-a82ac325d948@microchip.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/7/19 12:58 AM, Eugen.Hristev@microchip.com wrote:
[ ... ]
> Hello Guenter,
> 
> Thank you for the feedback.
> After reviewing this, can you please guide me towards one of the
> possible two directions: merge this driver with sama5d4_wdt , and have a
> single driver with support for both hardware blocks; or, have this
> driver separately , as in this patch series?
> 

I noticed the similarities. I don't know if it makes sense to reconcile
the two drivers; it seems to me the new chip uses the same basic core with
enhancements. In general, I prefer a single driver, but only if the result
doesn't end up being an if/else mess. Ultimately, it is really your call
to make.

Guenter
