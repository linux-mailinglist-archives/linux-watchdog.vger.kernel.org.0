Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C42E83EECBA
	for <lists+linux-watchdog@lfdr.de>; Tue, 17 Aug 2021 14:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236002AbhHQMsy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 17 Aug 2021 08:48:54 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:37555 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhHQMsx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 17 Aug 2021 08:48:53 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MYNeM-1mbRY10Oji-00VPid; Tue, 17 Aug 2021 14:48:19 +0200
Received: by mail-wr1-f45.google.com with SMTP id r7so28533985wrs.0;
        Tue, 17 Aug 2021 05:48:18 -0700 (PDT)
X-Gm-Message-State: AOAM530tTjOCDONB2supLX0YLTXJSp5vqdjYfeMajHbqEQPdIf22iFxv
        vxt4YlVNjMx++zaRDE+Gkq475EtEw86cv3itynU=
X-Google-Smtp-Source: ABdhPJzvLqUOdaDgcFLGV+XABbDpM4mCjcx48HbWxenpfaJrBkKR511cR4DsLPHZVVEVdbkZvTd3qw+I95Y1M2XpA5A=
X-Received: by 2002:adf:e107:: with SMTP id t7mr3868804wrz.165.1629204498645;
 Tue, 17 Aug 2021 05:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210817100845.11626-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210817100845.11626-1-lukas.bulwahn@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 17 Aug 2021 14:48:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0iPsbMr1QN4Rg7hhgkGO0n956SpoDH_Wt+OcFbye1__w@mail.gmail.com>
Message-ID: <CAK8P3a0iPsbMr1QN4Rg7hhgkGO0n956SpoDH_Wt+OcFbye1__w@mail.gmail.com>
Subject: Re: [PATCH] watchdog: remove dead iop watchdog timer driver
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:nwkCjRYMlfl9G/dxqoPDJVtxiQ8/tlfkkCrdGDBO0wxBKu5dhXK
 +3v3qdWwcOgvi1oP+XHo1xoLR14PLergVoU+rS3fbmdycCrdtjN1+9UR/FWemOsDXAKLorp
 jKXtkuQ9xkqnxrbNOWG2pEwQ1uL/GzAP7sfl3E1mB9Gs9X5Uw7UfViqXH/TUs5at5vm4ifR
 9UDcGHkefm9SLuh3L79Dw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kR92IiCwtpk=:nnsFKJRLVV68bQQW/M9lAE
 Cr2BZy0R0qJEQkRh6WbluHdc3n5PkY6Btf6ti87wS1c9lkvMMSMUnoKgvMQMeM1k4tX92GJ9i
 QXeMxJNa13Ogvd1EJri+bHr3QT/sDLgrFnHV6as3T3JpsX0scjj9RaO5fQ5vAq8HDERN7i1s2
 /3QooNGRAWQtHjSI1ZfV8Qce4CtkjSON1zI8OESiQsnaQ2q9OBZ+jCri38lGIyORqma5rhdI4
 vTFFb1wzRAz9mBFFrjBflsQ0cOn7CdaW3MpUkESa6g6UCNPO/E/YAqZzkG0Rs2mwXn5la1Qxd
 1SkE289T3RcBM1X4J4P71YuXfQRu3nMijrtaZP3pn87BZofQnpvdkDSyreAGMgqGTTiXPMwo1
 kkEYMKv48kiWycgb8AC6A1xIYyt8tAeauZjrKNx7vMwV573HC0vD8LCGiApu7KUQnoeRIVw0l
 TuNlP+8NXM0yDJ+5aiw/3WbFTjYRzbEor5sPFekp09PCQ9vUzoU1DHTiFsmtM0xQbV7fe7Ozl
 +5RuSIfBccncWwKnQPihNCuuwrrHJyTpcYwL+nVXwi3mb518xkCxWGI1hlf4W3J9o0M3oYtGC
 j6QZYPChzQMQF58NQoSCkuF7T7FcAmRWAlmjCcxSMJEUBQxbk+3SX4Ze1xw8nwhexK6wbAHeM
 aOw8bE7zHZjhiMvESb4hPBKD4sqQ1EL0Lg4LY7Q3aY44IKg0PypTchOVqAFkRs0vmkrjztIk7
 zQrHVPTlnxwnhX+/C7BTfj3j3yzmX/vTF1cK7K19m5hq7op3W9Ky80KeTSFMllCGWAw5AsMbS
 DCdW1zeFEEYNdYNMSTHHRpEe/KPpg8OLFnYtdJ0g9WTKXya5vFepzivuAx0OJCylTj8FNzS
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Aug 17, 2021 at 12:08 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 59d3ae9a5bf6 ("ARM: remove Intel iop33x and iop13xx support")
> removes the config ARCH_IOP13XX in ./arch/arm/Kconfig.
>
> Hence, since then, the corresponding iop watchdog timer driver is dead
> code. Remove this dead driver.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

I would add a reference to ec2e32ca661e ("watchdog: iop_wdt only builds for
mach-iop13xx") in the changelog, before that it could be selected but
did not build.

Acked-by: Arnd Bergmann <arnd@arndb.de>
