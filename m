Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7498F33C
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730474AbfHOSYT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:24:19 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38929 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729121AbfHOSYT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:24:19 -0400
Received: by mail-pg1-f194.google.com with SMTP id u17so1646607pgi.6;
        Thu, 15 Aug 2019 11:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Tq0RhCUnnzg3TmVJ2wdxJLGKMFGfuG2E2XyOO2UwyKE=;
        b=BuIzgoF4gSrYN7PjjiEhzrVpIVCz7Uus/TaowRqKu+JXIPFfHvV8HhLTiszqzxsJFG
         ZPcQb1cJ8nIpnI+nkqz+7pmlTPI/RzKpiIXtRxhUrnKlLxz/O0JvfxTAe6vGHX3N35Vq
         WT2KmHpoVbGNXEZZINyq3z/kHiQVZbh3Yc6Nx5ORI0U/5OVXwcfMwCYH8gzYzL2ti42Z
         4Vn+OVageymsNZKeCMHVyJSGCbU1pU7iizrV2gFqKmX7iTaqWWwkwqhAXSBuUQ56ueTB
         LqEjb9Zn2iOcjlN+sFIOsjN7iTsypDGTrYJnZJAUbLvCPdXXq9YNjtLOjAxDPvB8yNXv
         s/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Tq0RhCUnnzg3TmVJ2wdxJLGKMFGfuG2E2XyOO2UwyKE=;
        b=gaipfjQ8AmdzECxQhHe4v37bjwljxjEFqUWbdiEWwYAT5gNCfiz1kbRgSILi+kLZU4
         FPBpaiMse2GhZJZaBat88YDEoGxbowvSBgxK8us+9SbL3u4dSNr0W/NcDa8CB1SdpTed
         wDQUAa8AREov3B3ZalEvcpT0aEOVZIWTDb35WUuC9oOfK3Po3YdZabXZyf/F1qmnX0mO
         QQ/MPZQBRJk+/Fd0RcGKsx/KSOs0w6xXpa0En4P0waxTS0360M9nIvm8SaAQ9mGUDrIN
         grevgfd15zr0fbvTFqCyEX6zsA63/LuaVkkk5WXkEfqhHuuRbwBt327ohUxecUUF0Mz+
         R+1g==
X-Gm-Message-State: APjAAAVvfybLX6en5+Ox4PcGi6j508TWiSAniZhD0ibaxaPkiqf3g49I
        41b4YctmKN4kXPf2qrcQzjY=
X-Google-Smtp-Source: APXvYqxZpmG7qSPj0auTmk/X3qfBm5DSsdzB2B8sb1oIamSiaZ4+0Z3F9c48p94kuAH6mv8n3v21dQ==
X-Received: by 2002:aa7:9d07:: with SMTP id k7mr6670972pfp.94.1565893458650;
        Thu, 15 Aug 2019 11:24:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k8sm2644106pgm.14.2019.08.15.11.24.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:24:18 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:24:17 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 19/22] watchdog: ziirave_wdt: Drop status polling code
Message-ID: <20190815182417.GO14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-20-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-20-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:09:03PM -0700, Andrey Smirnov wrote:
> Bootloader firmware doesn't implement DOWNLOAD_START or
> DOWNLOAD_PACKET in a non-blocking way. It will stretch the clock of
> the first status byte read until the operation is complete. Polling
> for the status is not really necessary since it will always succed on
> the first try. Replace polling code with a simple single byte read to
> simplify things.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
