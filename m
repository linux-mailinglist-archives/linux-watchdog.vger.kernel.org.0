Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E69A3D5659
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 11:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbhGZIjd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Jul 2021 04:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbhGZIjc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Jul 2021 04:39:32 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120FDC061757
        for <linux-watchdog@vger.kernel.org>; Mon, 26 Jul 2021 02:20:02 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id k1so10704033plt.12
        for <linux-watchdog@vger.kernel.org>; Mon, 26 Jul 2021 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=jpy0tZLpRHfN1fMfFe5IrdwhQ+g2LPOUWzpB5iP18t0=;
        b=d6E0qycWjjnAuIPBqbMPBXh+e90BvTHEmBokpoppqFBtb51uifZq8T/6ybM0EcOrmR
         zJ8z38FREBjR5a0hEsUoJJUSRguW8KA0zCzNVVsMq1gRZ0b3ZWmGoEjCZ/y/H3DnRmRN
         600dxTZ8+fkLM+XVwM5lwAOcYcsz49AUydP5NnHRk2+zHlpNgfb97tgWp8f3g9oqv5Su
         2yq1O8o5+98YZ1Ds0hKnmY7ZxOAZy4aott8hSJkt6sTHAaM/RRm52PHVO98+75F+CGCg
         UxWR9Ci++aE0Dln72PfM0TvlNAMpvSQ9w1ZBuYVxHpbOMw7T1NlP89B0vRzINrQZQkPw
         lxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=jpy0tZLpRHfN1fMfFe5IrdwhQ+g2LPOUWzpB5iP18t0=;
        b=TT+mgkiD7+l/dIhyCRR4nLRE24dbiPA4l5s2Y0YRSHAE4Sa2Duu46S3HfWQm4p+jgZ
         C9GAHMZyse7o/gnz65wgwSoz82UTeDleZymx7LiKEjNYAMTnBweKdadQyjYzZ5N1TAVa
         /bCorSDsBzWKHakYffsXWV+sQFsKN8vYKG8GVnFoFNHc5IH1djUeghZOmFloS1SCjpbh
         9ZVaA8gpzhJeexaQ7OXBxO1iufmB9nJyQNxwAOkWNnDKzX/pui9jHAkylr8Q2bnXAFxh
         N8fS7QeeyeqXEQtYMeDDRsTG4ClSibIYhmQNF8W7PoHq5NyHpUE+K4rNIokY1tS5Bxds
         c2qQ==
X-Gm-Message-State: AOAM533WesanfWv2RdoSzeIgCZ8yhY9J+xK5dE8uZkQo7JmmtCqp4+Ct
        x6HCyBEzvZcibVg5L93lSwie+vV8PoUHqYhL1/A=
X-Google-Smtp-Source: ABdhPJymXiz5KK1BTIc8Ba9LQm6+tbElcBoy5p2TIMH16SpE9ZhvpB4eHEsmFtK7McXky8LCNLoVQM8ekFbBcYwyt/c=
X-Received: by 2002:a62:6103:0:b029:396:f515:94bf with SMTP id
 v3-20020a6261030000b0290396f51594bfmr5267294pfb.4.1627291201416; Mon, 26 Jul
 2021 02:20:01 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Date:   Mon, 26 Jul 2021 12:19:50 +0300
Message-ID: <CAPWNY8XhrutxYzRregOJYQYte87W-wbtf1OoPAfnMVRD1oKzNw@mail.gmail.com>
Subject: iTCO_wdt regression on Dell laptop
To:     Guenter Roeck <linux@roeck-us.net>,
        Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello,

I have a Dell Inspiron 15-5547 laptop, with systemd configured to set
the watchdog to a 2-minute expiry (due to reasons):

# /etc/systemd/system.conf
[Manager]
RuntimeWatchdogSec=3D2min

So far this setting has worked without problems (including kernels
5.12.15 and 5.13.1); however, with kernel 5.13.4 the system inevitably
reboots after a few minutes of uptime.

I have tracked the issue down to commit 5e65819a006e "watchdog:
iTCO_wdt: Account for rebooting on second timeout" in the 5.13.x
branch (commit cb011044e34c upstream). There are no unexpected reboots
when running 5.13.4 with this commit reverted.

Indeed with the original 5.13.4 kernel, `wdctl` always reports
"Timeleft:" counting down from 60 seconds (sometimes very nearly
reaching 0), even though "Timeout" is still reported to be 120.

(systemd pokes the watchdog as part of its main loop, trying to so
approximately "between 1/4 and 1/2" of the configured interval.
According to wdctl these pings usually happen every 35-50 seconds but
sometimes nearly at the 60-second mark, and thanks to the kernel now
also dividing the requested expiry by /2 which systemd is unaware of,
sometimes this ends up being a *very* close race to 0.)

This is a Haswell-era machine (i7-4510U) and seems to have a "version
0" watchdog:

Jul 26 11:34:04 archlinux kernel: Linux version 5.13.4-arch2-1
(linux@archlinux) (gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #1
SMP PREEMPT Thu, 22 Jul 2021 20:46:28 +0000
Jul 26 11:34:14 frost kernel: iTCO_vendor_support: vendor-support=3D0
Jul 26 11:34:14 frost kernel: iTCO_wdt iTCO_wdt.3.auto: Found a Lynx
Point_LP TCO device (Version=3D2, TCOBASE=3D0x1860)
Jul 26 11:34:14 frost systemd[1]: Using hardware watchdog 'iTCO_wdt',
version 0, device /dev/watchdog
Jul 26 11:34:14 frost systemd[1]: Set hardware watchdog to 2min.
Jul 26 11:34:14 frost kernel: iTCO_wdt iTCO_wdt.3.auto: initialized.
heartbeat=3D30 sec (nowayout=3D0)

--=20
Mantas Mikul=C4=97nas
